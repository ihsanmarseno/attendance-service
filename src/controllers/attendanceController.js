import prisma from "../db.js";
import axios from "axios";

export const clockIn = async (req, res) => {
  const userId = req.user.id;

  if (!req.file) {
    return res.status(400).json({ msg: "Foto bukti wajib diunggah" });
  }

  const photoUrl = `/uploads/${req.file.filename}`;

  try {
    const newAttendance = await prisma.attendance.create({
      data: {
        userId: userId,
        photoUrl: photoUrl,
      },
    });
    res.status(201).json({
      msg: "Absensi berhasil direkam",
      data: newAttendance,
    });
  } catch (error) {
    res
      .status(500)
      .json({ msg: "Terjadi kesalahan pada server", error: error.message });
  }
};

export const getMyAttendance = async (req, res) => {
  const userId = req.user.id;
  const page = parseInt(req.query.page) || 1;
  const pageSize = parseInt(req.query.pageSize) || 10;
  const skip = (page - 1) * pageSize;

  try {
    const [totalItems, attendances] = await Promise.all([
      prisma.attendance.count({ where: { userId } }),
      prisma.attendance.findMany({
        where: { userId },
        orderBy: { clockInTime: "desc" },
        skip,
        take: pageSize,
      }),
    ]);

    // Tambah status late
    const enriched = attendances.map((a) => {
      const clock = new Date(a.clockInTime);
      const hour = clock.getHours();
      return {
        ...a,
        status: hour >= 8 ? "Late" : "On Time",
      };
    });

    res.json({
      data: enriched,
      meta: {
        totalItems,
        totalPages: Math.ceil(totalItems / pageSize),
        currentPage: page,
        pageSize,
      },
    });
  } catch (error) {
    res
      .status(500)
      .json({ msg: "Terjadi kesalahan pada server", error: error.message });
  }
};

export const getAllAttendance = async (req, res) => {
  const filter = req.query.filter || "all"; // all | today | thisWeek
  const page = parseInt(req.query.page) || 1;
  const pageSize = parseInt(req.query.pageSize) || 10;
  const skip = (page - 1) * pageSize;

  let whereCondition = {};
  if (filter === "today") {
    const start = new Date();
    start.setHours(0, 0, 0, 0);
    const end = new Date();
    end.setHours(23, 59, 59, 999);
    whereCondition.clockInTime = { gte: start, lte: end };
  } else if (filter === "thisWeek") {
    const now = new Date();
    const firstDay = new Date(now);
    firstDay.setDate(now.getDate() - now.getDay());
    firstDay.setHours(0, 0, 0, 0);
    const lastDay = new Date(now);
    lastDay.setDate(now.getDate() + (6 - now.getDay()));
    lastDay.setHours(23, 59, 59, 999);
    whereCondition.clockInTime = { gte: firstDay, lte: lastDay };
  }

  try {
    const allAttendances = await prisma.attendance.findMany({
      where: whereCondition,
      orderBy: { clockInTime: "desc" },
    });

    const enriched = await Promise.all(
      allAttendances.map(async (a) => {
        let userData = null;
        try {
          const userRes = await axios.get(
            `${process.env.USER_SERVICE_URL}/v1/api/auth/users/${a.userId}`,
            { headers: { Authorization: `${req.headers.authorization}` } }
          );
          userData = userRes.data.user;
        } catch (err) {
          console.error("Failed fetch user:", a.userId, err.message);
        }

        const clock = new Date(a.clockInTime);
        return {
          id: a.id,
          clockInTime: a.clockInTime,
          photoUrl: a.photoUrl,
          status: clock.getHours() >= 8 ? "Late" : "On Time",
          user: userData,
        };
      })
    );

    const employeeAttendances = enriched.filter(
      (a) => a.user && a.user.role === "employee"
    );

    const totalItems = employeeAttendances.length;
    const paginatedData = employeeAttendances.slice(skip, skip + pageSize);

    res.json({
      data: paginatedData,
      meta: {
        totalItems,
        totalPages: Math.ceil(totalItems / pageSize),
        currentPage: page,
        pageSize,
      },
    });
  } catch (error) {
    res.status(500).json({
      msg: "Terjadi kesalahan pada server",
      error: error.message,
    });
  }
};
