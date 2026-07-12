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
exports.sourceWiseReport = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT
    ls.source_name AS landing_page,

    SUM(CASE WHEN l.status='Potential' THEN 1 ELSE 0 END) AS Potential,

    SUM(CASE WHEN l.status='Enquiry' THEN 1 ELSE 0 END) AS Enquiry,

    SUM(CASE WHEN l.status='Call Back' THEN 1 ELSE 0 END) AS Call_Back,

    SUM(CASE WHEN l.status='Hindi Person' THEN 1 ELSE 0 END) AS Hindi_Person,

    SUM(CASE WHEN l.status='Sales Done With Us' THEN 1 ELSE 0 END) AS Sales_Done_With_Us,

    SUM(CASE WHEN l.status='Out Of Station' THEN 1 ELSE 0 END) AS Out_Of_Station,

    SUM(CASE WHEN l.status='Not Interested' THEN 1 ELSE 0 END) AS Not_Interested,

    SUM(CASE WHEN l.status='Genuine Reject' THEN 1 ELSE 0 END) AS Genuine_Reject,

    SUM(CASE WHEN l.status='Fraud Reject' THEN 1 ELSE 0 END) AS Fraud_Reject,

    SUM(CASE WHEN l.status='New' THEN 1 ELSE 0 END) AS New_Count,

    SUM(CASE WHEN l.status='Contacted' THEN 1 ELSE 0 END) AS Contacted,

    SUM(CASE WHEN l.status='Sales Done With Others' THEN 1 ELSE 0 END) AS Sales_Done_With_Others,

    COUNT(l.id) AS Total

FROM lead_sources ls

LEFT JOIN leads l
ON l.lead_source_id = ls.id

GROUP BY ls.id, ls.source_name

ORDER BY ls.source_name;
    `);

    res.json({
      success: true,
      data: rows,
    });
  } catch (err) {
    console.log(err);

    res.status(500).json({
      success: false,
      message: err.message,
    });
  }
};
