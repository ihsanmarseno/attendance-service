import express from "express";
import {
  clockIn,
  getMyAttendance,
  getAllAttendance,
} from "../controllers/attendanceController.js";
import { verifyToken, isAdmin } from "../middleware/authMiddleware.js";
import upload from "../middleware/uploadMiddleware.js";

const router = express.Router();

// Semua rute di bawah ini memerlukan otentikasi token
router.use(verifyToken);

// Rute untuk Karyawan & Admin
router.post("/clock-in", upload.single("photo"), clockIn);
router.get("/my-history", getMyAttendance);

// Rute khusus untuk Admin
router.get("/all", isAdmin, getAllAttendance);

export default router;
