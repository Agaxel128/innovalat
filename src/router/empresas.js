import { Router } from "express";
import { createEmpresa, deleteEmpresa, getAllEmpresas, getEmpresa, updateEmpresa } from "../controller/empresas.js";

const empresaRouter = Router()

empresaRouter.get("/", getAllEmpresas)

empresaRouter.post("/", createEmpresa)

empresaRouter.get("/:id", getEmpresa)

empresaRouter.put("/:id", updateEmpresa)

empresaRouter.delete("/:id", deleteEmpresa)

export default empresaRouter