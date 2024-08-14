```bash
npm -i vite -g
vite
```

### backlog:
- seleccion de cuenta de registros.
- [x] listar transacciones.
     - [x] cambiar tama;o de la lista (columnas mostradas).
     - [x] editar al tocar el registro.
          - [x] abrir con 'abono' o 'cargo' segun corresponda.
     - [x] cambiar indice de fila.
          - [x] en modo 'edicion'.
          - [x] en modo 'agregar'.
     - [x] quitar ceros en columnas `Abono` y `Cargo`.
- seleccion multiple de celdas.
     - identificacion de tipo de dato.
     - recuento de numeros.
     - suma de numeros.
     - promedio de numeros.
     - recuento general.
- [x] resumen de totales.
     - [x] recuento de registros.
     - [x] suma de abonos y cargos.
- filtros en encabezados.
     - filtro de fechas.
     - filtro de categorias (motivo, detalle, fuente).
     - filtro de numeros (listado normal y mayor o menor que).
- [x] ingresar registro de transaccion.
     - [x] campos:
          - [x] fecha;
          - [x] abono;
          - [x] cargo;
          - [x] motivo;
          - [x] detalle.
     - [x] autocompletado para motivo, detalle y fuente.
     - lista desplegable en autocompletado para celular.
     - [x] que los nuevos registros sean cargos por defectos.
- [x] modo de eliminacion de registros.
     - [x] marcar registros a eliminar.
     - [x] boton para confirmar.
- [x] boton para guardar datos localmente.
- [x] exportar informacion a `json`.
- [x] importar `json`.
- [x] PWA:
     - [x] pagina principal separada de la app.
     - [x] prompt automatico para instalar PWA.
     - [x] estado para no volver a insistir en instalacion de PWA.
- [ ] menu bar.
     - import button.
     - export button.
     - [x] app ver.
     - [x] dev ver.
- [x] docker file.
