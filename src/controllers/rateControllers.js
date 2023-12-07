import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import Sequelize from "sequelize";
import { responseData } from "../config/response.js";

let model = initModels(sequelize);

export const addRate = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;
    const date_rate = new Date();
    //Kiểm tra nếu đã tồn tại user_id, và res_id trùng thì tăng amount lên 1 rồi return
    const existingRate = await model.rate_res.findOne({
      where: { user_id, res_id },
    });

    if (existingRate) {
      const updateAmount = existingRate.dataValues.amount + 1;
      await model.rate_res.update(
        { amount: updateAmount },
        {
          where: {
            user_id,
            res_id,
          },
        }
      );
      responseData(
        res,
        "Bạn đã đánh giá nhà hàng này thêm 1 lần nữa",
        existingRate,
        201
      );
      return;
    }

    const newRate = await model.rate_res.create({
      user_id,
      res_id,
      amount: Math.floor(Math.random() * 11),
      date_rate,
    });
    responseData(res, "Thêm đánh giá thành công", newRate, 200);
  } catch (err) {
    responseData(res, "Lỗi: ", err.message, 500);
  }
};
