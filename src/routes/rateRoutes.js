import express from "express";
import { addRate } from "../controllers/rateControllers.js";

const rateRoutes = express.Router();
rateRoutes;

// API thêm đánh giá
rateRoutes.put("/add-rate", addRate);

export default rateRoutes;
