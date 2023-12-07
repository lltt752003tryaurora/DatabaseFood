import { Sequelize } from "sequelize";
import config from "../config/config.js";

const sequelize = new Sequelize(config.database, config.user, config.pass, {
  host: config.host,
  port: config.port,
  dialect: config.dialect, 
});

export default sequelize;

try {
  await sequelize.authenticate();
  console.log("Connection has been established successfully.");
} catch (err) {
  console.error("Unable to connect to the database:", err);
}
