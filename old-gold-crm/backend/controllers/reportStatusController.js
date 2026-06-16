const db = require("../config/db");

exports.getReportStatuses = async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM report_status_master");

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
