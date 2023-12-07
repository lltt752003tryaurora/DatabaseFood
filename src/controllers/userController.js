import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import Sequelize from "sequelize";
import { responseData } from "../config/response.js";

let model = initModels(sequelize);

export const getLikesUser = async (req, res) => {
  try {
    let { userId } = req.params;

    let data = await model.userFood.findAll({
      include: [
        {
          model: model.like_res,
          as: "like_res",
          where: {
            user_id: userId,
          },
        },
      ],
    });
    responseData(
      res,
      "Lấy danh sách thành công",
      data[0].dataValues.like_res,
      200
    );
  } catch (err) {
    console.log(err);
    responseData(res, "Lỗi: ", err.message, 500);
  }
};

export const addOrderUser = async (req, res) => {
  try {
    const { user_id, food_id } = req.body;

    //Kiểm tra nếu đã tồn tại user_id, và food_id trùng thì tăng amount lên 1 rồi return
    const existingOrder = await model.order_food.findOne({
      where: { user_id, food_id },
    });

    if (existingOrder) {
      const updateAmount = existingOrder.dataValues.amount + 1;
      await model.order_food.update(
        { amount: updateAmount },
        {
          where: {
            user_id,
            food_id,
          },
        }
      );
      responseData(
        res,
        "Bạn đã đặt thêm món này 1 lần nữa",
        existingOrder,
        201
      );
      return;
    }

    const randomValue =
      Math.floor(Math.random() * (Number.MAX_SAFE_INTEGER - 4)) + 5; // số ngẫu nhiên từ 5 trở đi
    const newOrder = await model.order_food.create({
      user_id,
      food_id,
      amount: Math.floor(Math.random() * 11),
      code: `Code${randomValue}`,
      arr_sub_id: `Sub0${randomValue}`,
    });
    responseData(
      res,
      "Thêm order cho user_id " + user_id + " thành công",
      newOrder,
      200
    );
  } catch (err) {
    responseData(res, "Lỗi: ", err.message, 500);
  }
};

export const getRatesUser = async (req, res) => {
  try {
    let { userId } = req.params;

    let data = await model.userFood.findAll({
      include: [
        {
          model: model.rate_res,
          as: "rate_res", // Đảm bảo tên 'as' phải khớp với tên đã định nghĩa trong mối quan hệ
          where: {
            user_id: userId,
          },
        },
      ],
    });
    responseData(
      res,
      "Lấy danh sách thành công",
      data[0].dataValues,
      200
    );
  } catch (err) {
    console.log(err);
    responseData(res, "Lỗi: ", err.message, 500);
  }
};