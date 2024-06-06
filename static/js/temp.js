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

if (localStorage.getItem('install_app_alert') == null) {
     localStorage.setItem('install_app_alert', true);
}

if (localStorage.getItem('last_version') == null) {
     localStorage.setItem('last_version', 'v0.0.0');
}

onbeforeinstallprompt = (event) => {
     if (localStorage.getItem('install_app_alert') == 'true') {
          install_banner.showModal();
     }
};
