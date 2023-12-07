import express from "express";
import {
  getLikesRestaurant,
  getRatesRestaurant,
} from "../controllers/restaurantControllers.js";

const restaurantRoutes = express.Router();

// API lấy danh sách like theo nhà hàng
restaurantRoutes.get("/get-likes-restaurant/:resId", getLikesRestaurant);

// API lấy danh sách rate theo nhà hàng
restaurantRoutes.get("/get-rates-restaurant/:resId", getRatesRestaurant);
export default restaurantRoutes;
