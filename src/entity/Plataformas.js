import { EntitySchema } from 'typeorm'

export const Plataformas = new EntitySchema({
  name: 'mg_plataformas',
  columns: {
    id_plataforma: {
      primary: true,
      type: 'integer',
      generated: true,
      nullable: false
    },
    descripcion: {
      type: 'varchar',
      length: 16,
      nullable: false
    }
  },
  relations: {
    mg_mensajes: {
      type: 'one-to-many',
      target: 'mg_mensajes',
      inverseSide: 'mg_plataformas'
    }
  }
})