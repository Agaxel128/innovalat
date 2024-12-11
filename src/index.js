import express from 'express';
import { AppDataSource } from "./conectDB.js";
import { PORT } from './config.js';
import cliente from './router/clientes.js';
import empresas from './router/empresas.js'
import estados from './router/estados.js'
import mensajes from './router/mensajes.js'
import operadoras from './router/operadoras.js'
import plataformas from './router/plataformas.js'
import usuarios from './router/usuarios.js'

const app = express()

app.use(express.json())

app.use("/api/clientes", cliente)
app.use("/api/empresas", empresas)
app.use("/api/estados", estados)
app.use("/api/mensajes", mensajes)
app.use("/api/operadoras", operadoras)
app.use("/api/plataformas", plataformas)
app.use("/api/usuarios", usuarios)

// Falta para el Inicio de Sesion (sign-in), Registro (sign-up), Cerrar Sesion (sign-out)
// app.use("/api/auth", autenticate)

AppDataSource.initialize().then(() => {
    console.log('Database is connect')
    app.listen(PORT, () => {
        console.log(`Listening on Port localhost:${PORT}`);
    })
}).catch((error) => {
    console.error(error)
})