let a; // test var to watch `registros``

function get_shit({ fecha, abono, cargo, motivo, detalle, fuente }) {
     if (fecha == null) fecha = '';
     else fecha = fecha.split('-').reverse().join('-');
     if (abono == null) abono = 0;
     if (cargo == null) cargo = 0;
     let new_log = [
          fecha,
          parseInt(abono),
          parseInt(cargo),
          motivo,
          detalle,
          fuente,
          false
     ];
     return new_log;
}
