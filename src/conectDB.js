import { DataSource } from "typeorm";
import { DATABASE } from "./config.js";
import { Usuarios } from './entity/usuarios.js';
import { Clientes } from './entity/clientes.js';
import { Estados } from './entity/estados.js';
import { Plataformas } from './entity/Plataformas.js';
import { Operadoras } from './entity/operadoras.js';
import { Empresas } from './entity/empresas.js';
import { Mensajes } from './entity/mensajes.js';

export const AppDataSource = new DataSource({
    type: 'postgres',
    host: 'localhost',
    port: 5432,
    username: 'postgres',
    password: 'losamigos',
    database: DATABASE,
    entities: [
        Estados, 
        Plataformas, 
        Usuarios, 
        Operadoras,
        Clientes,
        Empresas,
        Mensajes
    ],
    synchronize: true,
    logging: true
});

// Inicializar la conexión
AppDataSource.initialize()
    .then(() => {
        console.log("Conexión a la base de datos establecida correctamente.");
    })
    .catch((error) => {
        console.error("Error al conectar a la base de datos:", error);
    });