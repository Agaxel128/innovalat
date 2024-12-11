import { Router } from "express";
import { createPlataforma, deletePlataforma, getAllPlataformas, getPlataforma, updatePlataforma } from "../controller/plataformas.js";

const plataformasRouter = Router()

plataformasRouter.get("/", getAllPlataformas)

plataformasRouter.post("/", createPlataforma)

plataformasRouter.get("/:id", getPlataforma)

plataformasRouter.put("/:id", updatePlataforma)

plataformasRouter.delete("/:id", deletePlataforma)

export default plataformasRouter