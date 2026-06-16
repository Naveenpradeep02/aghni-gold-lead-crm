const express = require("express");

const router = express.Router();

const { getReportStatuses } = require("../controllers/reportStatusController");

const { protect } = require("../middleware/authMiddleware");

router.get("/", protect, getReportStatuses);

module.exports = router;
