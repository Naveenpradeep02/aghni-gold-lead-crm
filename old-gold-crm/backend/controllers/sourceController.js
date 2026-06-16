const db = require("../config/db");

exports.getSources = async (req, res) => {
  try {
    const [rows] = await db.query(
      "SELECT * FROM lead_sources WHERE status='active'",
    );

    res.json({
      success: true,
      data: rows,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
