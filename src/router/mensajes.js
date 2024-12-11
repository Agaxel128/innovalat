import { Router } from "express";
import { createMensaje, deleteMensaje, getAllMensajes, getMensaje, updateMensaje } from "../controller/mensajes.js";

const mensajeRouter = Router()

mensajeRouter.get("/", getAllMensajes)

mensajeRouter.post("/", createMensaje)

mensajeRouter.get("/:id", getMensaje)

mensajeRouter.put("/:id", updateMensaje)

mensajeRouter.delete("/:id", deleteMensaje)

export default mensajeRouter