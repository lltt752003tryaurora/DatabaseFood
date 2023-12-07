import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import Sequelize from "sequelize";
import { responseData } from "../config/response.js";

let model = initModels(sequelize);
let Op = Sequelize.Op;

export const getLikesRestaurant = async (req, res) => {
  try {
    let { resId } = req.params; // id nhà hàng

    let data = await model.restaurant.findAll({
      include: [
        {
          model: model.like_res,
          as: "like_res", // Đảm bảo tên 'as' phải khớp với tên đã định nghĩa trong mối quan hệ
          where: {
            res_id: resId,
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

export const getRatesRestaurant = async (req, res) => {
  try {
    let { resId } = req.params; // id nhà hàng

    let data = await model.restaurant.findAll({
      include: [
        {
          model: model.rate_res,
          as: "rate_res", // Đảm bảo tên 'as' phải khớp với tên đã định nghĩa trong mối quan hệ
          where: {
            res_id: resId,
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
