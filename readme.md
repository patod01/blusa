app inicialmente orientada a telefono.

```bash
npm -i vite -g
vite
```

backlog:
- login de usuario.
     - log in.
- log off.
- seleccion de cuenta.
- [x] listar transacciones.
     - [x] cambiar tama;o de la lista (columnas mostradas).
     - [x] editar al tocar el registro.
          - abrir con 'abono' o 'cargo' segun corresponda.
     - [ ] cambiar indice de fila.
          - [x] en modo 'edicion'.
          - en modo 'agregar'.
- seleccion multiple de celdas.
     - identificacion de tipo de dato.
     - recuento de numeros.
     - suma de numeros.
     - promedio de numeros.
     - recuento general.
- resumen de totales.
     - filtro de fechas.
     - filtro de categorias (motivo, detalle, fuente).
     - recuento de registros.
     - suma de abonos y cargos.
     - promedio de numeros.
- [ ] ingresar registro de transaccion.
     - ~~siguiente campo al pulsar enter.~~
     - [x] campos:
          - [x] fecha;
          - [x] abono;
          - [x] cargo;
          - [x] motivo;
          - [x] detalle.
     - [ ] autocompletado para motivo, detalle y fuente.
- [x] modo de eliminacion de registros.
     - [x] marcar registros a eliminar.
     - [x] boton para confirmar.
- [x] boton para guardar datos localmente.
- exportar informacion a csv.
- importar csv.
- [ ] PWA:
     - [ ] pagina principal separada de la app.
     - [x] prompt automatico para instalar PWA.
     - [x] estado para no volver a insistir en instalacion de PWA.
- criptografia.
