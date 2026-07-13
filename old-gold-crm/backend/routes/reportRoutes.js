const express = require("express");

const router = express.Router();

const {
  matrixReport,
  exportReport,
  getReportStatuses,
} = require("../controllers/reportController");

const { protect } = require("../middleware/authMiddleware");

router.get("/matrix", protect, matrixReport);

router.get("/export", protect, exportReport);

router.get("/statuses", protect, getReportStatuses);
module.exports = router;
