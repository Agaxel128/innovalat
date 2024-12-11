import { EntitySchema } from "typeorm";

export const Mensajes = new EntitySchema({
  name: 'mg_mensajes',
  columns: {
    id_envio: {
      primary: true,
      type: 'integer',
      generated: true,
      nullable: false
    },
    id_estado: {
      type: 'integer',
      nullable: false
    },
    id_operadora: {
      type: 'integer',
      nullable: false
    },
    id_plataforma: {
      type: 'integer',
      nullable: false
    },
    id_empresa: {
      type: 'integer',
      nullable: false
    },
    codigo_cliente: {
      type: 'integer',
      nullable: false
    },
    codigo_usuario: {
      type: 'integer',
      unique: true
    },
    numero_celular: {
      type: 'varchar',
      nullable: false,
      length: 16
    },
    mensaje: {
      type: 'varchar',
      nullable: false,
      length: 500
    },
    estado_envio: {
      type: 'boolean'
    },
    fecha_envio: {
      type: 'timestamp with time zone',
      createDate: true
    },
    fecha_confirmacion: {
      type: 'timestamp with time zone',
      nullable: false
    }
  },
  relations: {
    empresas: {
      type: 'many-to-one',
      target: 'mg_empresas',
      joinColumn: {
        name: 'id_empresa',
        referencedColumnName: 'id_empresa'
      },
      cascade: false
    },
    estados: {
      type: 'many-to-one',
      target: 'mg_estados',
      joinColumn: {
        name: 'id_estado',
        referencedColumnName: 'id_estado'
      },
      cascade: false
    },
    plataformas: {
      type: 'many-to-one',
      target: 'mg_plataformas',
      joinColumn: {
        name: 'id_plataforma',
        referencedColumnName: 'id_plataforma'
      },
      cascade: false
    },
    usuarios: {
      type: 'many-to-one',
      target: 'mg_usuarios',
      joinColumn: {
        name: 'codigo_usuario',
        referencedColumnName: 'codigo_usuario'
      },
      cascade: false
    },
    operadoras: {
      type: 'many-to-one',
      target: 'mg_operadoras',
      joinColumn: {
        name: 'id_operadora',
        referencedColumnName: 'id_operadora'
      },
      cascade: false
    },
    clientes: {
      type: 'many-to-one',
      target: 'mg_clientes',
      joinColumn: {
        name: 'codigo_cliente',
        referencedColumnName: 'codigo_cliente'
      },
      cascade: false
    }
  }
})