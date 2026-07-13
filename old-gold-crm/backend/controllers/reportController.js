const db = require("../config/db");
const ExcelJS = require("exceljs");
const { Parser } = require("json2csv");
const PDFDocument = require("pdfkit");

exports.matrixReport = async (req, res) => {
  try {
    const { type = "daily", fromDate, toDate } = req.query;

    let whereClause = "";
    const values = [];

    // Date Filter
    if (fromDate && toDate) {
      whereClause = `
        WHERE DATE(l.created_at) BETWEEN ? AND ?
      `;
      values.push(fromDate, toDate);
    }

    // Group By
    let groupBy = "";

    switch (type) {
      case "weekly":
        groupBy = `
          GROUP BY
          YEAR(l.created_at),
          WEEK(l.created_at),
          ls.id,
          ls.source_name
        `;
        break;

      case "monthly":
        groupBy = `
          GROUP BY
          YEAR(l.created_at),
          MONTH(l.created_at),
          ls.id,
          ls.source_name
        `;
        break;

      default:
        groupBy = `
          GROUP BY
          ls.id,
          ls.source_name
        `;
    }

    const sql = `
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

      ${whereClause}

      ${groupBy}

      ORDER BY ls.source_name
    `;

    const [rows] = await db.query(sql, values);

    res.json({
      success: true,
      data: rows,
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

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
exports.exportReport = async (req, res) => {
  try {
    const { type = "daily", fromDate, toDate, format = "excel" } = req.query;

    if (format !== "excel") {
      return res.status(400).json({
        success: false,
        message: "Invalid format",
      });
    }
    if (format === "csv") {
      const fields = [
        "landing_page",
        "Potential",
        "Enquiry",
        "Call_Back",
        "Hindi_Person",
        "Sales_Done_With_Us",
        "Out_Of_Station",
        "Not_Interested",
        "Genuine_Reject",
        "Fraud_Reject",
        "New_Count",
        "Contacted",
        "Sales_Done_With_Others",
        "Total",
      ];

      const parser = new Parser({ fields });

      const csv = parser.parse(rows);

      res.header("Content-Type", "text/csv");

      res.attachment(`${type}-report.csv`);

      return res.send(csv);
    }
    if (format === "pdf") {
      const doc = new PDFDocument({
        margin: 30,
        size: "A4",
        layout: "landscape",
      });

      res.setHeader("Content-Type", "application/pdf");

      res.setHeader(
        "Content-Disposition",
        `attachment; filename=${type}-report.pdf`,
      );

      doc.pipe(res);

      doc.fontSize(18);

      doc.text(`${type.toUpperCase()} MATRIX REPORT`, {
        align: "center",
      });

      doc.moveDown();

      rows.forEach((row) => {
        doc.fontSize(10).text(
          `${row.landing_page}

Potential : ${row.Potential}

Enquiry : ${row.Enquiry}

Call Back : ${row.Call_Back}

Hindi Person : ${row.Hindi_Person}

Sales Done With Us : ${row.Sales_Done_With_Us}

Out Of Station : ${row.Out_Of_Station}

Not Interested : ${row.Not_Interested}

Genuine Reject : ${row.Genuine_Reject}

Fraud Reject : ${row.Fraud_Reject}

New : ${row.New_Count}

Contacted : ${row.Contacted}

Sales Done With Others : ${row.Sales_Done_With_Others}

Total : ${row.Total}

----------------------------------------
`,
        );
      });

      doc.end();

      return;
    }
    let whereClause = "";
    const values = [];

    if (fromDate && toDate) {
      whereClause = `
        WHERE DATE(l.created_at)
        BETWEEN ?
        AND ?
      `;

      values.push(fromDate, toDate);
    }

    let groupBy = "";

    switch (type) {
      case "weekly":
        groupBy = `
        GROUP BY
        YEAR(l.created_at),
        WEEK(l.created_at),
        ls.id,
        ls.source_name
        `;
        break;

      case "monthly":
        groupBy = `
        GROUP BY
        YEAR(l.created_at),
        MONTH(l.created_at),
        ls.id,
        ls.source_name
        `;
        break;

      default:
        groupBy = `
        GROUP BY
        ls.id,
        ls.source_name
        `;
    }

    const sql = `
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

      ${whereClause}

      ${groupBy}

      ORDER BY ls.source_name
    `;

    const [rows] = await db.query(sql, values);

    const workbook = new ExcelJS.Workbook();

    const worksheet = workbook.addWorksheet("Report");

    worksheet.columns = [
      { header: "Landing Page", key: "landing_page", width: 35 },
      { header: "Potential", key: "Potential", width: 15 },
      { header: "Enquiry", key: "Enquiry", width: 15 },
      { header: "Call Back", key: "Call_Back", width: 15 },
      { header: "Hindi Person", key: "Hindi_Person", width: 18 },
      { header: "Sales Done With Us", key: "Sales_Done_With_Us", width: 22 },
      { header: "Out Of Station", key: "Out_Of_Station", width: 18 },
      { header: "Not Interested", key: "Not_Interested", width: 18 },
      { header: "Genuine Reject", key: "Genuine_Reject", width: 18 },
      { header: "Fraud Reject", key: "Fraud_Reject", width: 18 },
      { header: "New", key: "New_Count", width: 12 },
      { header: "Contacted", key: "Contacted", width: 15 },
      {
        header: "Sales Done With Others",
        key: "Sales_Done_With_Others",
        width: 25,
      },
      { header: "Total", key: "Total", width: 12 },
    ];

    rows.forEach((row) => worksheet.addRow(row));

    res.setHeader(
      "Content-Type",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    );

    res.setHeader(
      "Content-Disposition",
      `attachment; filename=${type}-report.xlsx`,
    );

    await workbook.xlsx.write(res);

    res.end();
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
