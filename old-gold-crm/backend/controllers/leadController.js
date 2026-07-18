const db = require("../config/db");

// exports.createLead = async (req, res) => {
//   try {
//     const { name, mobile, email, city, gold_type, weight } = req.body;

//     const [rates] = await db.query(
//       "SELECT * FROM gold_rates WHERE gold_type=?",
//       [gold_type],
//     );

//     if (rates.length === 0) {
//       return res.status(404).json({
//         success: false,
//         message: "Gold rate not found",
//       });
//     }

//     const rate = rates[0];

//     const market_value = Number(weight) * Number(rate.new_rate);

//     const purchase_value = Number(weight) * Number(rate.old_rate);

//     const [result] = await db.query(
//       `INSERT INTO leads
//       (
//         name,
//         mobile,
//         email,
//         city,
//         gold_type,
//         weight,
//         market_value,
//         purchase_value
//       )
//       VALUES (?,?,?,?,?,?,?,?)`,
//       [
//         name,
//         mobile,
//         email,
//         city,
//         gold_type,
//         weight,
//         market_value,
//         purchase_value,
//       ],
//     );

//     res.status(201).json({
//       success: true,
//       leadId: result.insertId,
//       market_value,
//       purchase_value,
//     });
//   } catch (error) {
//     console.log(error);

//     res.status(500).json({
//       success: false,
//       message: error.message,
//     });
//   }
// };
async function getLeadSourceId(data) {
  let sourceName = "Website";
  const utmSource = (data.utm_source || "").toLowerCase();

  if (data.gclid || data.gbraid || data.wbraid) {
    sourceName = "Google Ads";
  } else if (data.msclkid) {
    sourceName = "Microsoft Ads";
  } else if (data.fbclid) {
    if ((data.utm_source || "").toLowerCase() === "instagram") {
      sourceName = "Instagram Ads";
    } else {
      sourceName = "Facebook Ads";
    }
  } else if (utmSource.includes("google")) {
    sourceName = "Organic Search";
  } else if ((data.utm_source || "").toLowerCase() === "whatsapp") {
    sourceName = "WhatsApp";
  } else if ((data.utm_source || "").toLowerCase() === "youtube") {
    sourceName = "YouTube Ads";
  } else if ((data.utm_source || "").toLowerCase() === "linkedin") {
    sourceName = "LinkedIn Ads";
  } else if ((data.utm_source || "").toLowerCase() === "referral") {
    sourceName = "Referral";
  }

  const [rows] = await db.query(
    "SELECT id FROM lead_sources WHERE source_name=? LIMIT 1",
    [sourceName],
  );

  return {
    id: rows.length ? rows[0].id : 1,
    name: sourceName,
  };
}
exports.createLead = async (req, res) => {
  try {
    const {
      customer_name,
      mobile,
      email,
      city,
      pincode,
      gold_type,
      weight,
      gold_location,
      ornament_type,
      bank_finance_name,
      pledged_amount,
      platform,
      campaign_id,
      campaign_name,
      adset_id,
      adset_name,
      adgroup_id,
      adgroup_name,
      ad_id,
      ad_name,
      gclid,
      fbclid,
      msclkid,
      device,
      network,
      landing_page,
      utm_source,
      utm_medium,
      utm_campaign,
      utm_content,
      utm_term,
    } = req.body;

    // Auto Capture
    const ip_address =
      req.headers["x-forwarded-for"]?.split(",")[0] ||
      req.socket.remoteAddress ||
      req.ip;

    const user_agent = req.headers["user-agent"] || null;

    const referrer = req.headers["referer"] || req.headers["referrer"] || null;
    const leadSource = await getLeadSourceId(req.body);
    // Get Gold Rate
    const [rates] = await db.query(
      "SELECT * FROM gold_rates WHERE gold_type = ?",
      [gold_type],
    );

    if (rates.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Gold rate not found",
      });
    }

    const rate = rates[0];

    const market_value = Number(weight) * Number(rate.new_rate);
    const purchase_value = Number(weight) * Number(rate.old_rate);

    // Insert Lead
    const [result] = await db.query(
      `INSERT INTO leads (
    customer_name,
    mobile,
    email,
    city,
    pincode,
    gold_type,
    weight,
    market_value,
    purchase_value,
    gold_location,
    ornament_type,
    bank_finance_name,
    pledged_amount,
    lead_source_id,
    platform,
    campaign_id,
    campaign_name,
    adset_id,
    adset_name,
    adgroup_id,
    adgroup_name,
    ad_id,
    ad_name,
    gclid,
    fbclid,
    msclkid,
    device,
    network,
    landing_page,
    ip_address,
    user_agent,
    referrer,
    utm_source,
    utm_medium,
    utm_campaign,
    utm_content,
    utm_term
  )
 VALUES (
 ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
)`,
      [
        customer_name,
        mobile,
        email,
        city,
        pincode,
        gold_type,
        weight,
        market_value,
        purchase_value,
        gold_location,
        ornament_type,
        bank_finance_name,
        pledged_amount || 0,
        leadSource.id,
        platform || null,
        campaign_id || null,
        campaign_name || null,
        adset_id || null,
        adset_name || null,
        adgroup_id || null,
        adgroup_name || null,
        ad_id || null,
        ad_name || null,
        gclid || null,
        fbclid || null,
        msclkid || null,
        device || null,
        network || null,
        landing_page || null,
        ip_address,
        user_agent,
        referrer,
        utm_source || null,
        utm_medium || null,
        utm_campaign || null,
        utm_content || null,
        utm_term || null,
      ],
    );

    res.status(201).json({
      success: true,
      message: "Lead created successfully",
      leadId: result.insertId,
      market_value,
      purchase_value,
    });
  } catch (error) {
    console.error(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

exports.getLeads = async (req, res) => {
  try {
    const [leads] = await db.query("SELECT * FROM leads ORDER BY id DESC");

    res.json({
      success: true,
      data: leads,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

exports.updateLeadStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;

    const validStatus = [
      "Potential",
      "Enquiry",
      "Call Back",
      "Hindi Person",
      "Sales Done With Us",
      "Out Of Station",
      "Not Interested",
      "Genuine Reject",
      "Fraud Reject",
      "New",
      "Contacted",
      "Sales Done With Others",
      "Not Tally",
    ];

    if (!validStatus.includes(status)) {
      return res.status(400).json({
        success: false,
        message: "Invalid status",
      });
    }

    const [lead] = await db.query("SELECT * FROM leads WHERE id=?", [id]);

    if (lead.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Lead not found",
      });
    }

    await db.query("UPDATE leads SET status=? WHERE id=?", [status, id]);

    res.json({
      success: true,
      message: "Lead status updated successfully",
    });
  } catch (error) {
    console.log(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
exports.getLeadById = async (req, res) => {
  try {
    const { id } = req.params;

    const [lead] = await db.query("SELECT * FROM leads WHERE id=?", [id]);

    if (lead.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Lead not found",
      });
    }

    res.json({
      success: true,
      data: lead[0],
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
exports.monthlyLeads = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT
      MONTH(created_at) AS month,
      COUNT(*) AS total
      FROM leads
      GROUP BY MONTH(created_at)
      ORDER BY month
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
