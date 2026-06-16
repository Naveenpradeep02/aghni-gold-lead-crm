const express = require("express");

const router = express.Router();

const { dailyMatrixReport } = require("../controllers/reportController");

const { protect } = require("../middleware/authMiddleware");

router.get("/daily-matrix", protect, dailyMatrixReport);

module.exports = router;
