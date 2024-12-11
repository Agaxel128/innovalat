import { EntitySchema } from 'typeorm'

export const Empresas = new EntitySchema({
  name: 'mg_empresas',
  columns: {
    id_empresa: {
      primary: true,
      type: 'integer',
      generated: true,
      nullable: false
    },
    nombre: {
      type: 'varchar',
      length: 30,
      nullable: false
    },
    codigo_ciudad: {
      type: 'varchar',
      length: 10,
      nullable: false
    },
    ocupacion: {
      type: 'varchar',
      length: 12,
      nullable: false
    },
    direccion: {
      type: 'varchar',
      length: 50,
      nullable: false
    },
    referencia: {
      type: 'varchar',
      length: 50,
      nullable: false
    },
    telefono: {
      type: 'varchar',
      length: 12,
      nullable: true
    },
    celular: {
      type: 'varchar',
      length: 12,
      nullable: true
    },
    correo: {
      type: 'varchar',
      length: 30,
      nullable: false
    },
    estado: {
      type: 'boolean',
      default: false
    }
  },
  relations: {
    mg_mensajes: {
      type: 'one-to-many',
      target: 'mg_mensajes',
      inverseSide: 'mg_empresas'
    }
  }
})