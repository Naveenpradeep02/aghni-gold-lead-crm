const express = require("express");
const router = express.Router();

const { getLeadSources } = require("../controllers/leadSourceController");

router.get("/", getLeadSources);

module.exports = router;
