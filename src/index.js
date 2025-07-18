import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import path from "path";
import { fileURLToPath } from "url";
import attendanceRoutes from "./routes/attendanceRoute.js";

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 5002;

app.use(cors());
app.use(express.json());

// Middleware penting untuk membuat gambar di folder 'uploads' bisa diakses via URL
app.use("/uploads", express.static(path.join(__dirname, "../public/uploads")));

// Gunakan Rute
app.use("/v1/api/attendance", attendanceRoutes);

app.listen(PORT, () => {
  console.log(`Attendance Service berjalan di port ${PORT}`);
});
