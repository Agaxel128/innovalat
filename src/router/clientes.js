import { Router } from "express";
import { createCliente, deleteCliente, getAllClientes, getCliente, updateCliente } from "../controller/clientes.js";

const clienteRouter = Router()

clienteRouter.get("/", getAllClientes)

clienteRouter.post("/", createCliente)

clienteRouter.get("/:id", getCliente)

clienteRouter.put("/:id", updateCliente)

clienteRouter.delete("/:id", deleteCliente)

export default clienteRouter