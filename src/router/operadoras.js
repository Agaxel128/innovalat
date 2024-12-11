import { Router } from "express";
import { createOperadora, deleteOperadora, getAllOperadoras, getOperadora, updateOperadora } from "../controller/operadoras.js";

const operadorasRouter = Router()

operadorasRouter.get("/", getAllOperadoras)

operadorasRouter.post("/", createOperadora)

operadorasRouter.get("/:id", getOperadora)

operadorasRouter.put("/:id", updateOperadora)

operadorasRouter.delete("/:id", deleteOperadora)

export default operadorasRouter