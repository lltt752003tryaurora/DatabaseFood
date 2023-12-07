import _sequelize from "sequelize";
const { Model, Sequelize } = _sequelize;

export default class rate_res extends Model {
  static init(sequelize, DataTypes) {
    return super.init(
      {
        user_id: {
          type: DataTypes.INTEGER,
          allowNull: true,
          references: {
            model: "userFood",
            key: "user_id",
          },
          primaryKey: true,
        },
        res_id: {
          type: DataTypes.INTEGER,
          allowNull: true,
          references: {
            model: "restaurant",
            key: "res_id",
          },
          primaryKey: true,
        },
        amount: {
          type: DataTypes.INTEGER,
          allowNull: true,
        },
        date_rate: {
          type: DataTypes.DATE,
          allowNull: true,
        },
      },
      {
        sequelize,
        tableName: "rate_res",
        timestamps: false,
        indexes: [
          {
            name: "user_id",
            using: "BTREE",
            fields: [{ name: "user_id" }],
          },
          {
            name: "res_id",
            using: "BTREE",
            fields: [{ name: "res_id" }],
          },
        ],
      }
    );
  }
}