import { Router } from "express";
import { createUsuario, deleteUsuario, getAllUsuarios, getUsuario, updateUsuario } from "../controller/usuarios.js";

const usuarioRouter = Router()

usuarioRouter.get("/", getAllUsuarios)

usuarioRouter.post("/", createUsuario)

usuarioRouter.get("/:id", getUsuario)

usuarioRouter.put("/:id", updateUsuario)

usuarioRouter.delete("/:id", deleteUsuario)

export default usuarioRouter