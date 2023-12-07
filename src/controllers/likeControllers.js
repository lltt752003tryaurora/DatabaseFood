import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import Sequelize, { where } from "sequelize";
import { responseData } from "../config/response.js";

let model = initModels(sequelize);
let Op = Sequelize.Op;

export const addLike = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;
    const date_like = new Date();

    // Kiểm tra đã có lượt like này trong danh sách chưa
    const existingLike = await model.like_res.findOne({
      where: { user_id, res_id },
    });

    if (existingLike) {
      responseData(res, "Đã xóa like", "Không thêm được nữa", 500);
      return;
    }

    const newLike = await model.like_res.create({ user_id, res_id, date_like });

    responseData(res, "add like thành công", newLike, 200);
  } catch (err) {
    responseData(res, "Lỗi: ", err.message, 500);
  }
};

export const removeLike = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;

    const deleteLike = await model.like_res.destroy({
      where: {
        user_id,
        res_id,
      },
    });

    console.log(deleteLike);

    if (deleteLike) {
      responseData(res, "xóa like thành công", deleteLike, 200);
      return;
    } else {
      responseData(res, "Ko tìm thấy lượt like ", deleteLike, 500);
    }
  } catch (err) {
    responseData(res, "Lỗi: ", err.message, 500);
  }
};
