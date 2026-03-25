document.addEventListener("DOMContentLoaded", () => {
    // Fájl beolvasása fetch API-val
    fetch('nevek.txt')
        .then(response => {
            if (!response.ok) {
                throw new Error('A fájl nem található vagy nem olvasható (HTTP hiba: ' + response.status + ')');
            }
            return response.text();
        })
        .then(rawData => {
            processData(rawData);
        })
});

function processData(rawData) {
    const lines = rawData.trim().split('\n');
    let csaladCounts = {};
    let elsoUtonevCounts = {};
    let masodikUtonevCounts = {};
    let utonevCounts = {}; 
    let fullNCounts = {}; 
    let csaladOsztaly = {};

    lines.forEach(line => {
        let parts = line.split('\t');
        if(parts.length < 2) return;
        let osztaly = parts[0].trim();
        let nameStr = parts[1].trim();
        let nameParts = nameStr.split(' ').filter(x => x.trim() !== '');
        
        let c = nameParts[0];
        let u1 = nameParts.length > 1 ? nameParts[1] : null;
        let u2 = nameParts.length > 2 ? nameParts[2] : null;

        // Családnevek
        csaladCounts[c] = (csaladCounts[c] || 0) + 1;
        
        // Osztályok tárolása
        if (!csaladOsztaly[c]) csaladOsztaly[c] = new Set();
        csaladOsztaly[c].add(osztaly);

        // Utónevek & "1 utóneves" teljes nevek
        if (u1) {
            elsoUtonevCounts[u1] = (elsoUtonevCounts[u1] || 0) + 1;
            utonevCounts[u1] = (utonevCounts[u1] || 0) + 1;
            let p1 = c + " " + u1;
            fullNCounts[p1] = (fullNCounts[p1] || 0) + 1;
        }
        if (u2) {
            masodikUtonevCounts[u2] = (masodikUtonevCounts[u2] || 0) + 1;
            utonevCounts[u2] = (utonevCounts[u2] || 0) + 1;
            let p2 = c + " " + u2;
            fullNCounts[p2] = (fullNCounts[p2] || 0) + 1;
        }
    });

    const getTop = (dict) => {
        const entries = Object.entries(dict);
        if (entries.length === 0) return ["-", 0];
        return entries.sort((a,b) => b[1] - a[1])[0];
    };
    
    // Top Eredmények beállítása
    document.getElementById('stat-csalad').innerHTML = `${getTop(csaladCounts)[0]} (${getTop(csaladCounts)[1]} db)`;
    document.getElementById('stat-elso').innerHTML = `${getTop(elsoUtonevCounts)[0]} (${getTop(elsoUtonevCounts)[1]} db)`;
    document.getElementById('stat-masodik').innerHTML = `${getTop(masodikUtonevCounts)[0]} (${getTop(masodikUtonevCounts)[1]} db)`;
    document.getElementById('stat-utonev').innerHTML = `${getTop(utonevCounts)[0]} (${getTop(utonevCounts)[1]} db)`;

    // 3 Leggyakoribb (1 utónévvel)
    const sortedFullN = Object.entries(fullNCounts).sort((a,b) => b[1] - a[1]);
    const top3Html = sortedFullN.slice(0, 3).map(x => `<li class="list-group-item d-flex justify-content-between align-items-center">${x[0]}<span class="badge bg-secondary rounded-pill">${x[1]}</span></li>`).join('');
    document.getElementById('stat-top3-nevek').innerHTML = top3Html;

    // Legritkább nevek
    const rarestFullN = sortedFullN.filter(x => x[1] === 1).map(x => x[0]).sort((a, b) => a.localeCompare(b, 'hu'));
    document.getElementById('stat-legritkabb').innerHTML = rarestFullN.join(', ');

    // Családnevek és osztályaik (>= 3)
    const resOszt = Object.entries(csaladOsztaly)
        .filter(x => csaladCounts[x[0]] >= 3)
        .sort((a, b) => a[0].localeCompare(b[0], 'hu'))
        .map(x => `<li class="list-group-item"><strong>${x[0]}</strong> (${csaladCounts[x[0]]} diák): <span class="text-secondary">${Array.from(x[1]).sort().join(', ')}</span></li>`);
    document.getElementById('stat-osztalyok').innerHTML = resOszt.join('');

    // Táblázatok kitöltése
    const tbodyCsalad = document.querySelector('#tbl-csaladnevek tbody');
    tbodyCsalad.innerHTML = ''; // Előző adatok törlése biztos ami biztos
    Object.entries(csaladCounts).sort((a,b) => b[1] - a[1]).forEach(([nev, db]) => {
        tbodyCsalad.innerHTML += `<tr><td>${nev}</td><td>${db}</td></tr>`;
    });

    const tbodyUtonev = document.querySelector('#tbl-utonevek tbody');
    tbodyUtonev.innerHTML = '';
    Object.entries(utonevCounts).sort((a,b) => b[1] - a[1]).forEach(([nev, db]) => {
        tbodyUtonev.innerHTML += `<tr><td>${nev}</td><td>${db}</td></tr>`;
    });
}

// Táblázat rendező logika
window.sortDirs = {};
window.sortTable = function(tableId, colIdx, type) {
    const table = document.getElementById(tableId);
    const tbody = table.tBodies[0];
    const rows = Array.from(tbody.querySelectorAll('tr'));
    const dirId = tableId + colIdx;
    const dir = window.sortDirs[dirId] === 'asc' ? 'desc' : 'asc';
    window.sortDirs[dirId] = dir;
    
    rows.sort((a, b) => {
        let v1 = a.cells[colIdx].innerText;
        let v2 = b.cells[colIdx].innerText;
        if (type === 'num') {
            return dir === 'asc' ? parseInt(v1) - parseInt(v2) : parseInt(v2) - parseInt(v1);
        } else {
            return dir === 'asc' ? v1.localeCompare(v2, 'hu') : v2.localeCompare(v1, 'hu');
        }
    });
    rows.forEach(r => tbody.appendChild(r));
}