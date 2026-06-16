const db = require("../config/db");

exports.dailyMatrixReport = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT
      ls.source_name,
      rs.status_name,
      COUNT(l.id) as total

      FROM lead_sources ls

      LEFT JOIN leads l
      ON ls.id = l.source_id

      LEFT JOIN report_status_master rs
      ON rs.id = l.report_status_id

      GROUP BY
      ls.source_name,
      rs.status_name

      ORDER BY ls.id
    `);

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
