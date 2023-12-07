// loại bỏ cách gọi app.user nhiều lần và xử lí endpoint nếu bị trùng ở các file controllers

import express from "express";
import restaurantRoutes from "./restaurantRoutes.js";
import userRoutes from "./userRoutes.js";
import likeRoutes from "./likeRoutes.js";
import rateRoutes from "./rateRoutes.js";

const rootRoute = express.Router();

rootRoute.use("/restaurant", restaurantRoutes);
rootRoute.use("/user", userRoutes);
rootRoute.use("/like", likeRoutes);
rootRoute.use("/rate", rateRoutes);

export default rootRoute;
