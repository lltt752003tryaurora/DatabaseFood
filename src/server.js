import express from "express";
import cors from "cors";
import rootRoute from "./routes/rootRoutes.js";

const app = express();

app.use(cors({
    origin: "*",
}))

app.use(express.json());
app.listen(2000);

app.use(rootRoute);

