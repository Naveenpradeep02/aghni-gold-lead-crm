const db = require("../config/db");

exports.getLeadSources = async (req, res) => {
  try {
    const [rows] = await db.query(
      "SELECT * FROM lead_sources WHERE status='active' ORDER BY source_name",
    );

    res.json({
      success: true,
      data: rows,
    });
  } catch (err) {
    console.error(err);

    res.status(500).json({
      success: false,
      message: err.message,
    });
  }
};
