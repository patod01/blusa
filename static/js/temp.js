let a;

function get_shit({ fecha, abono, cargo, motivo, detalle, fuente }) {
     fecha = fecha.split('-').reverse().join('-');
     if (abono == null) abono = 0;
     if (cargo == null) cargo = 0;
     let new_row = [ fecha, abono, cargo, motivo, detalle, fuente, false ];
     console.log(new_row);
     return new_row;
}
