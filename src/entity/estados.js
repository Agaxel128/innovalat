import { EntitySchema } from 'typeorm'

export const Estados = new EntitySchema({
  name: 'mg_estados',
  columns: {
    id_estado: {
      primary: true,
      type: 'integer',
      nullable: false,
      generated: true
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
      inverseSide: 'mg_estados'
    }
  }
})
