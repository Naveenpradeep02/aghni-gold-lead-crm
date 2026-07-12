const express = require("express");
const cors = require("cors");
require("dotenv").config();
const net = require("net");

const socket = new net.Socket();

const app = express();

const authRoutes = require("./routes/authRoutes");
const goldRateRoutes = require("./routes/goldRateRoutes");
const leadRoutes = require("./routes/leadRoutes");
const dashboardRoutes = require("./routes/dashboardRoutes");
const reportRoutes = require("./routes/reportRoutes");
const sourceRoutes = require("./routes/sourceRoutes");
const reportStatusRoutes = require("./routes/reportStatusRoutes");
const followupRoutes = require("./routes/followupRoutes");
const leadSourceRoutes = require("./routes/leadSourceRoutes");

require("./config/db");

socket.setTimeout(10000);

socket.connect(3306, "82.25.121.136", () => {
  console.log("PORT 3306 REACHABLE");
  socket.destroy();
});

socket.on("timeout", () => {
  console.log("PORT 3306 TIMEOUT");
  socket.destroy();
});

socket.on("error", (err) => {
  console.log("PORT TEST ERROR:", err.message);
});

// app.use(cors());

app.use(
  cors({
    origin: "*",
  }),
);

app.use(express.json());

app.get("/", (req, res) => {
  res.send("Old Gold CRM API Running");
});
app.use("/api/auth", authRoutes);
app.use("/api/gold-rates", goldRateRoutes);
app.use("/api/leads", leadRoutes);
app.use("/api/dashboard", dashboardRoutes);
app.use("/api/reports", reportRoutes);
app.use("/api/sources", sourceRoutes);
app.use("/api/report-statuses", reportStatusRoutes);
app.use("/api/follow-ups", followupRoutes);
app.use("/api/lead-sources", leadSourceRoutes);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Server Running On ${PORT}`);
});

// const bcrypt = require("bcryptjs");

// bcrypt.hash("admin123", 10).then(console.log);
