const express = require("express");

const router = express.Router();

const { getSources } = require("../controllers/sourceController");

const { protect } = require("../middleware/authMiddleware");

router.get("/", protect, getSources);

module.exports = router;
