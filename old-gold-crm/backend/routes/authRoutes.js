const express = require("express");

const { login, register, getMe } = require("../controllers/authController");

const { protect } = require("../middleware/authMiddleware");

const { authorize } = require("../middleware/roleMiddleware");

const router = express.Router();

router.post("/register", protect, authorize("super_admin"), register);

router.post("/login", login);

router.get("/me", protect, getMe);

module.exports = router;
