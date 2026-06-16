const db = require("../config/db");

exports.getDashboardStats = async (req, res) => {
  try {
    const [[totalLeads]] = await db.query("SELECT COUNT(*) total FROM leads");

    const [[newLeads]] = await db.query(
      "SELECT COUNT(*) total FROM leads WHERE status='new'",
    );

    const [[contactedLeads]] = await db.query(
      "SELECT COUNT(*) total FROM leads WHERE status='contacted'",
    );

    const [[purchasedLeads]] = await db.query(
      "SELECT COUNT(*) total FROM leads WHERE status='purchased'",
    );

    const [[marketValue]] = await db.query(
      "SELECT SUM(market_value) total FROM leads",
    );

    const [[purchaseValue]] = await db.query(
      "SELECT SUM(purchase_value) total FROM leads",
    );

    const [latestLeads] = await db.query(`
      SELECT *
      FROM leads
      ORDER BY created_at DESC
      LIMIT 4
    `);

    const [goldRates] = await db.query(`
      SELECT *
      FROM gold_rates
    `);

    res.json({
      success: true,
      data: {
        totalLeads: totalLeads.total || 0,
        newLeads: newLeads.total || 0,
        contactedLeads: contactedLeads.total || 0,
        purchasedLeads: purchasedLeads.total || 0,
        marketValue: marketValue.total || 0,
        purchaseValue: purchaseValue.total || 0,
        latestLeads,
        goldRates,
      },
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
