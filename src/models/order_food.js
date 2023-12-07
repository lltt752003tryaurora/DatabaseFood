import _sequelize from "sequelize";
const { Model, Sequelize } = _sequelize;

export default class order_food extends Model {
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
        food_id: {
          type: DataTypes.INTEGER,
          allowNull: true,
          references: {
            model: "food",
            key: "food_id",
          },
          primaryKey: true,
        },
        amount: {
          type: DataTypes.INTEGER,
          allowNull: true,
        },
        code: {
          type: DataTypes.STRING(100),
          allowNull: true,
        },
        arr_sub_id: {
          type: DataTypes.STRING(100),
          allowNull: true,
        },
      },
      {
        sequelize,
        tableName: "order_food",
        timestamps: false,
        indexes: [
          {
            name: "user_id",
            using: "BTREE",
            fields: [{ name: "user_id" }],
          },
          {
            name: "food_id",
            using: "BTREE",
            fields: [{ name: "food_id" }],
          },
        ],
      }
    );
  }
}
