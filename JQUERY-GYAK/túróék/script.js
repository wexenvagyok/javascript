document.addEventListener("DOMContentLoaded", () => {
    fetch('nevek.txt')
        .then(valasz => valasz.text())
        .then(szoveg => adatokFeldolgozasa(szoveg));
});

function adatokFeldolgozasa(szoveg) {
    const sorok = szoveg.trim().split('\n');
    
    const csaladnevek = {};
    const elsoUtonevek = {};
    const masodikUtonevek = {};
    const utonevek = {}; 
    const teljesNevek = {}; 
    const csaladOsztalyok = {};

    sorok.forEach(sor => {
        const reszek = sor.split('\t');
        if (reszek.length < 2) return;
        
        const osztaly = reszek[0].trim();
        const nevReszek = reszek[1].trim().split(' ').filter(resz => resz !== '');
        
        const csaladnev = nevReszek[0];
        const utonev1 = nevReszek[1] || null;
        const utonev2 = nevReszek[2] || null;

        csaladnevek[csaladnev] = (csaladnevek[csaladnev] || 0) + 1;
        
        if (!csaladOsztalyok[csaladnev]) csaladOsztalyok[csaladnev] = new Set();
        csaladOsztalyok[csaladnev].add(osztaly);

        const utonevRogzites = (utonev, celLista) => {
            if (!utonev) return;
            celLista[utonev] = (celLista[utonev] || 0) + 1;
            utonevek[utonev] = (utonevek[utonev] || 0) + 1;
            
            const teljesNev = `${csaladnev} ${utonev}`;
            teljesNevek[teljesNev] = (teljesNevek[teljesNev] || 0) + 1;
        };

        utonevRogzites(utonev1, elsoUtonevek);
        utonevRogzites(utonev2, masodikUtonevek);
    });

    const leggyakoribbKereses = (lista) => {
        const elemek = Object.entries(lista);
        return elemek.length ? elemek.reduce((max, aktualis) => aktualis[1] > max[1] ? aktualis : max) : ["-", 0];
    };
    
    const htmlBeallitas = (id, html) => document.getElementById(id).innerHTML = html;

    const topCsalad = leggyakoribbKereses(csaladnevek);
    const topElso = leggyakoribbKereses(elsoUtonevek);
    const topMasodik = leggyakoribbKereses(masodikUtonevek);
    const topUtonev = leggyakoribbKereses(utonevek);

    htmlBeallitas('stat-csalad', `${topCsalad[0]} (${topCsalad[1]} db)`);
    htmlBeallitas('stat-elso', `${topElso[0]} (${topElso[1]} db)`);
    htmlBeallitas('stat-masodik', `${topMasodik[0]} (${topMasodik[1]} db)`);
    htmlBeallitas('stat-utonev', `${topUtonev[0]} (${topUtonev[1]} db)`);

    const rendezettTeljesNevek = Object.entries(teljesNevek).sort((a, b) => b[1] - a[1]);
    
    const top3Html = rendezettTeljesNevek.slice(0, 3)
        .map(nev => `<li class="list-group-item d-flex justify-content-between align-items-center">${nev[0]}<span class="badge bg-secondary rounded-pill">${nev[1]}</span></li>`)
        .join('');
    htmlBeallitas('stat-top3-nevek', top3Html);

    const ritkaNevek = rendezettTeljesNevek.filter(nev => nev[1] === 1)
        .map(nev => nev[0])
        .sort((a, b) => a.localeCompare(b, 'hu'))
        .join(', ');
    htmlBeallitas('stat-legritkabb', ritkaNevek);

    const osztalyokHtml = Object.entries(csaladOsztalyok)
        .filter(elem => csaladnevek[elem[0]] >= 3)
        .sort((a, b) => a[0].localeCompare(b[0], 'hu'))
        .map(elem => `<li class="list-group-item"><strong>${elem[0]}</strong> (${csaladnevek[elem[0]]} diák): <span class="text-secondary">${Array.from(elem[1]).sort().join(', ')}</span></li>`)
        .join('');
    htmlBeallitas('stat-osztalyok', osztalyokHtml);

    const tablazatKeszites = (szelektor, adatok) => {
        const tablazatTorzs = document.querySelector(`${szelektor} tbody`);
        
        const rendezhetoTomb = [];
        for (const nev in adatok) {
            rendezhetoTomb.push({ 
                nev: nev, 
                darab: adatok[nev] 
            });
        }
        
        rendezhetoTomb.sort((a, b) => b.darab - a.darab);
        
        let htmlTartalom = '';
        for (const elem of rendezhetoTomb) {
            htmlTartalom += `<tr><td>${elem.nev}</td><td>${elem.darab}</td></tr>`;
        }
        
        tablazatTorzs.innerHTML = htmlTartalom;
    };

    tablazatKeszites('#tbl-csaladnevek', csaladnevek);
    tablazatKeszites('#tbl-utonevek', utonevek);
}