import { EntitySchema } from 'typeorm'

export const Operadoras = new EntitySchema({
  name: 'mg_operadoras',
  columns: {
    id_operadora: {
      primary: true,
      type: 'integer',
      generated: true,
      nullable: false
    },
    codigo_pais: {
      type: 'varchar',
      length: 6,
      nullable: false
    },
    descripcion: {
      type: 'text',
      nullable: false
    }
  },
  relations: {
    mg_mensajes: {
      type: 'one-to-many',
      target: 'mg_mensajes',
      inverseSide: 'mg_operadoras'
    }
  }
})