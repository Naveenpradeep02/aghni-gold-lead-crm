const mysql = require("mysql2");
require("dotenv").config();

// const pool = mysql.createPool({
//   host: process.env.DB_HOST,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_NAME,
//   waitForConnections: true,
//   connectionLimit: 10,
//   queueLimit: 0,
// });
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  connectTimeout: 30000,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});
// Test Database Connection
pool.getConnection((err, connection) => {
  if (err) {
    console.error("Database Connection Failed:");
    console.error(err);
    return;
  }

  console.log("✅ MySQL Connected Successfully");
  connection.release();
});

module.exports = pool.promise();
