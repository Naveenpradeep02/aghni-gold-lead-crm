const db = require("../config/db");

exports.getRates = async (req, res) => {
  try {
    const [rates] = await db.query("SELECT * FROM gold_rates");

    res.json({
      success: true,
      data: rates,
    });
  } catch (error) {
    console.log(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
exports.updateRate = async (req, res) => {
  try {
    const { gold_type, new_rate, old_rate } = req.body;

    await db.query(
      `UPDATE gold_rates
       SET new_rate=?,
           old_rate=?
       WHERE gold_type=?`,
      [new_rate, old_rate, gold_type],
    );

    await db.query(
      `INSERT INTO rate_history
      (gold_type,new_rate,old_rate,updated_by)
      VALUES (?,?,?,?)`,
      [gold_type, new_rate, old_rate, req.user.id],
    );

    res.json({
      success: true,
      message: "Rate Updated Successfully",
    });
  } catch (error) {
    console.log(error);

    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
