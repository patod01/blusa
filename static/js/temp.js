let a; // test var to watch `registros``
let install_prompt;

function get_shit({ fecha, abono, cargo, motivo, detalle, fuente }) {
     if (fecha == null) fecha = '';
     else fecha = fecha.split('-').reverse().join('-');
     if (abono == null) abono = 0;
     if (cargo == null) cargo = 0;
     if (motivo == null) motivo = '';
     if (detalle == null) detalle = '';
     if (fuente == null) fuente = '';
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
     localStorage.setItem('last_version', 'v0.1.0');
}

if (localStorage.getItem('data') == null) {
     localStorage.setItem('data', JSON.stringify([]));
}

onbeforeinstallprompt = (event) => {
     if (localStorage.getItem('install_app_alert') == 'true') {
          install_banner.showModal();
     }
     install_prompt = event;
};

window.addEventListener('appinstalled', () => {
     console.log('PWA was installed');
});

function getPWADisplayMode() {
     const isStandalone = window.matchMedia('(display-mode: standalone)').matches;
     if (document.referrer.startsWith('android-app://')) {
          return 'twa';
     } else if (navigator.standalone || isStandalone) {
          return 'standalone';
     }
     return 'browser';
}

function move_from(registros, old_index, new_index) {
     registros.splice(new_index, 0, registros.splice(old_index,1)[0]);
}

async function exportar(registros, blow) {
     const datos = new Blob(
          [JSON.stringify(registros, null, blow)],
          {type: "application/json"}
     );
     const archivo = document.createElement("a");
     archivo.href = window.URL.createObjectURL(datos);
     // archivo.target = '_blank';
     archivo.download = `bolsa-db.txt`;
     archivo.click();
}

async function commitAPI(element) {
     const owner = 'patod01';
     const repo = 'blusa';
     const branch = 'patriarch';
     const commitVerSpan = document.querySelector('#latest-commit-ver');

     fetch(`https://api.github.com/repos/${owner}/${repo}/commits/${branch}`)
          .then(response => response.json())
          .then(data => {
               const latestCommit = data.commit;
               const message = latestCommit.message;
               const commitVer = message.substring(2, message.indexOf(' '));
               element.innerHTML = `dev - v${commitVer}`
          })
          .catch(error => {
               console.error('Error al obtener el commit más reciente:', error);
          });
}

function extract_options(registros) {
     let dataset = {};
     let dataset_sources = new Set;

     for (let fila of registros) {
          if (fila[3] == '') continue;

          dataset[fila[3]] ?? (() => dataset[fila[3]] = new Set())();
          if (fila[4] != '') dataset[fila[3]].add(fila[4]);
          if (fila[5] != '') dataset_sources.add(fila[5]);
     }

     for (let lista in dataset) {
          dataset[lista] = Array(...dataset[lista]).sort();
     }

     return [dataset, Object.keys(dataset).sort(), Array(...dataset_sources).sort()];
}

let asdf;
