const express = require("express");

const router = express.Router();

const {
  addNote,
  createFollowup,
  getLeadNotes,
  getLeadFollowups,
} = require("../controllers/followupController");

const { protect } = require("../middleware/authMiddleware");

router.post("/notes", protect, addNote);

router.post("/followups", protect, createFollowup);

router.get("/followups/:id", protect, getLeadFollowups);

router.get("/notes/:id", protect, getLeadNotes);

module.exports = router;
