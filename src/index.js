import express from 'express';
import { AppDataSource, ensureDatabaseExists } from './conectDB.js';
import { PORT } from './config.js';
import cliente from './router/clientes.js';
import empresas from './router/empresas.js';
import cors from 'cors';
import estados from './router/estados.js';
import mensajes from './router/mensajes.js';
import operadoras from './router/operadoras.js';
import plataformas from './router/plataformas.js';
import usuarios from './router/usuarios.js';
import authRouter from './router/auth.js';

const app = express();

app.use(cors({
    origin: ['http://127.0.0.1:5500', 'http://localhost:5500'], // Orígenes permitidos
    methods: ['GET', 'POST', 'PUT', 'DELETE'], // Métodos permitidos
    credentials: true // Si necesitas cookies o autenticación
}));

app.use(express.json());

app.use("/api/clientes", cliente);
app.use("/api/empresas", empresas);
app.use("/api/estados", estados);
app.use("/api/mensajes", mensajes);
app.use("/api/operadoras", operadoras);
app.use("/api/plataformas", plataformas);
app.use("/api/usuarios", usuarios);
app.use("/api/auth", authRouter);

// Inicializar base de datos y aplicación
ensureDatabaseExists()
    .then(() => AppDataSource.initialize())
    .then(() => {
        console.log('Database is connected');
        app.listen(PORT, () => {
            console.log(`Listening on Port localhost:${PORT}`);
        });
    })
    .catch((error) => {
        console.error('Error al iniciar la aplicación:', error);
    });
