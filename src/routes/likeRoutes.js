import express from "express";
import { addLike, removeLike } from "../controllers/likeControllers.js";

const likeRoutes = express.Router();

// Thêm thông tin lượt like
likeRoutes.post("/add-like", addLike);

// Xóa thông tin lượt like
likeRoutes.delete("/remove-like", removeLike);

export default likeRoutes;
