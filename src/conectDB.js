import { DataSource } from "typeorm";
import { DATABASE } from "./config.js";
import { Usuarios } from './entity/usuarios.js';
import { Clientes } from './entity/clientes.js';
import { Estados } from './entity/estados.js';
import { Plataformas } from './entity/Plataformas.js';
import { Operadoras } from './entity/operadoras.js';
import { Empresas } from './entity/empresas.js';
import { Mensajes } from './entity/mensajes.js';
import pkg from 'pg';
import { execSync } from 'child_process';
import path from 'path';

const { Client } = pkg;

export const AppDataSource = new DataSource({
    type: 'postgres',
    host: 'localhost',
    port: 5432,
    username: 'postgres',
    password: 'postgres',
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
    synchronize: false,
    logging: true
});

export async function ensureDatabaseExists() {
    const client = new Client({
        host: 'localhost',
        port: 5432,
        user: 'postgres',
        password: 'postgres',
    });

    try {
        await client.connect();
        const res = await client.query(`SELECT 1 FROM pg_database WHERE datname = '${DATABASE}'`);
        if (res.rowCount === 0) {
            console.log(`Base de datos "${DATABASE}" no encontrada. Creando...`);
            await client.query(`CREATE DATABASE "${DATABASE}"`);
            console.log(`Base de datos "${DATABASE}" creada exitosamente.`);

            // Restaurar backup
            const dumpPath = path.resolve('./backup.dump');
            console.log("Ruta del backup: " + dumpPath);
            const restoreCommand = `pg_restore -U postgres -h localhost -d ${DATABASE} -v "${dumpPath}"`; // Comillas dobles
            console.log("Restaurando base de datos desde el backup...");
            try {
                execSync(restoreCommand); // Usar execSync para esperar a que termine
                console.log("Backup restaurado exitosamente.");
            } catch (error) {
                console.error("Error al restaurar el backup:", error.message);
                return;
            }
        } else {
            console.log(`Base de datos "${DATABASE}" ya existe.`);
        }
    } catch (error) {
        console.error("Error al verificar/crear la base de datos:", error.message);
    } finally {
        await client.end();
    }
}
