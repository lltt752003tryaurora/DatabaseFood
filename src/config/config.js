import dotenv from "dotenv";

dotenv.config();

export default {
  database: process.env.DB_DATABASE,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  pass: process.env.DB_PASS,
  user: process.env.DB_USER,
  dialect: process.env.DB_DIALECT,
};
