import { Router } from "express";
import { createEstado, deleteEstado, getAllEstados, getEstado, updateEstado } from "../controller/estados.js";

const estadosRouter = Router()

estadosRouter.get("/", getAllEstados)

estadosRouter.post("/", createEstado)

estadosRouter.get("/:id", getEstado)

estadosRouter.put("/:id", updateEstado)

estadosRouter.delete("/:id", deleteEstado)

export default estadosRouter