const db = require("../config/db");

exports.addNote = async (req, res) => {
  try {
    const { lead_id, note } = req.body;

    const [result] = await db.query(
      `INSERT INTO lead_notes
      (lead_id,note,created_by)
      VALUES (?,?,?)`,
      [lead_id, note, req.user.id],
    );

    res.status(201).json({
      success: true,
      noteId: result.insertId,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
exports.createFollowup = async (req, res) => {
  try {
    const { lead_id, followup_date, remarks } = req.body;

    const [result] = await db.query(
      `INSERT INTO lead_followups
      (
        lead_id,
        followup_date,
        remarks,
        created_by
      )
      VALUES (?,?,?,?)`,
      [lead_id, followup_date, remarks, req.user.id],
    );

    res.status(201).json({
      success: true,
      followupId: result.insertId,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
exports.getLeadFollowups = async (req, res) => {
  try {
    const { id } = req.params;

    const [followups] = await db.query(
      `SELECT *
       FROM lead_followups
       WHERE lead_id = ?
       ORDER BY followup_date DESC`,
      [id],
    );

    res.json({
      success: true,
      data: followups,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

exports.getLeadNotes = async (req, res) => {
  try {
    const { id } = req.params;

    const [notes] = await db.query(
      `SELECT *
       FROM lead_notes
       WHERE lead_id = ?
       ORDER BY created_at DESC`,
      [id],
    );

    res.json({
      success: true,
      data: notes,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};
