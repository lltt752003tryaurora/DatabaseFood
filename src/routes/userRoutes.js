import express from "express";
import { addOrderUser, getLikesUser, getRatesUser } from "../controllers/userController.js";

const userRoutes = express.Router();

// API lấy danh sách like theo người dùng
userRoutes.get("/get-likes-user/:userId", getLikesUser);

// API đặt món cho user (thêm món ăn trong đơn hàng của user đó)
userRoutes.put("/add-order-user", addOrderUser);


// API lấy danh sách like theo người dùng
userRoutes.get("/get-rates-user/:userId", getRatesUser);

export default userRoutes;
