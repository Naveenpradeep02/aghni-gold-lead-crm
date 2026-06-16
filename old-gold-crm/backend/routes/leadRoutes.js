const express = require("express");

const router = express.Router();

const {
  createLead,
  getLeads,
  getLeadById,
  updateLeadStatus,
  monthlyLeads,
} = require("../controllers/leadController");

const { protect } = require("../middleware/authMiddleware");

router.post("/", createLead);

router.get("/", protect, getLeads);

router.get("/:id", protect, getLeadById);

router.put("/:id/status", protect, updateLeadStatus);

router.get("/monthly-leads", protect, monthlyLeads);

module.exports = router;
