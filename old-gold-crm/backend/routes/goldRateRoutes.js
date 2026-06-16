const express = require("express");

const router = express.Router();

const { getRates, updateRate } = require("../controllers/goldRateController");

const { protect } = require("../middleware/authMiddleware");

const { authorize } = require("../middleware/roleMiddleware");

router.get("/", protect, getRates);

router.put("/", protect, authorize("super_admin"), updateRate);

module.exports = router;
