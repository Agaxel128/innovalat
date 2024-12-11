import { EntitySchema } from 'typeorm'

export const Usuarios = new EntitySchema({
  name: 'mg_usuarios',
  columns: {
    codigo_usuario: {
      primary: true,
      type: 'integer',
      generated: true,
      unique: true
    },
    password: {
      type: 'varchar',
      length: 255,
      nullable: false
    },
    fecha_inicio: {
      type: 'date',
      nullable: false
    },
    fecha_fin: {
      type: 'date',
      nullable: false
    },
    estado: {
      type: 'boolean',
      default: false
    }
  },
  relations: {
    mg_clientes: {
      type: 'one-to-many',
      target: 'mg_clientes',
      inverseSide: 'mg_usuarios'
    },
    mg_mensajes: {
      type: 'one-to-many',
      target: 'mg_mensajes',
      inverseSide: 'mg_usuarios'
    }
  }
})