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
    console.log("ERROR CODE:", err.code);
    console.log("ERROR NUMBER:", err.errno);
    console.log("ERROR MESSAGE:", err.message);
    console.log(err);
    return;
  }

  console.log("MYSQL CONNECTED");
  connection.release();
});

module.exports = pool.promise();
