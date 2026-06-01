let mrzSor1 = "";
let mrzSor2 = "";

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('fajlGomb').addEventListener('click', beolvasas);
    document.getElementById('datumGomb').addEventListener('click', ervenyessegEllenorzese);
});

// Betöltés
function beolvasas() {
    const fajlNev = document.getElementById('fajlNev').value.trim();
    
    if (fajlNev === "") {
        alert("Kérlek, adj meg egy fájlnevet!");
        return;
    }
    
    fetch(fajlNev)
        .then(response => {
            if (!response.ok) {
                throw new Error("Fájl nem található");
            }
            return response.text();
        })
        .then(text => {
            feldolgozas(text, fajlNev);
        })
}

// Az MRZ adatok biztonságos kiíratása és feldolgozása
function feldolgozas(nyersAdat, fajlNev) {
    const sorok = nyersAdat.split('\n').map(sor => sor.trim()).filter(sor => sor.length > 0);
    
    if (sorok.length < 2) {
        alert("A fájl nem tartalmaz megfelelő mennyiségű MRZ adatot!");
        return;
    }

    mrzSor1 = sorok[0];
    mrzSor2 = sorok[1];

    const kimenet = "Az állomány neve: " + fajlNev + "\n" + mrzSor1 + "\n" + mrzSor2;

    const elsoP = document.getElementById('elsoMegoldas');
    elsoP.innerText = kimenet;
    

    nemEllenorzes();
    nevKezeles();
}

function nemEllenorzes() {
    if (!mrzSor2) return;

    const nemKarakter = mrzSor2.charAt(20).toUpperCase();
    let nemSzoveg = "";

    if (nemKarakter === 'M') {
        nemSzoveg = "férfi";
    } else if (nemKarakter === 'F') {
        nemSzoveg = "nő";
    }

    document.getElementById('masodikMegoldas').innerText = "Az okmány tulajdonosa " + nemSzoveg + ".";
}

function ervenyessegEllenorzese() {
    const beirtDatum = document.getElementById('datumBe').value.trim();
    const harmadikP = document.getElementById('harmadikMegoldas');

    if (!mrzSor2) {
        harmadikP.innerText = "be kell olvasni egy MRZ fájlt!";
        return;
    }

    if (beirtDatum.length !== 6 || isNaN(beirtDatum)) {
        harmadikP.innerText = "6 számjegyet adj meg";
        return;
    }

    const lejaratSorozat = mrzSor2.substring(21, 27);

    if (parseInt(beirtDatum) > parseInt(lejaratSorozat)) {
        harmadikP.innerText = "Lejárt.";
    } else {
        harmadikP.innerText = "Érvényes.";
    }
}

function nevKezeles() {
    if (!mrzSor1) return;

    const teljesNevResz = mrzSor1.substring(5);

    let tisztaNev = teljesNevResz.replace(/</g, ' ').trim();
    tisztaNev = tisztaNev.replace(/\s+/g, ' ');

    let csonkoltSzoveg = "";
    if (mrzSor1.endsWith('<')) {
        csonkoltSzoveg = "A név nem csonkolt.";
    } else {
        csonkoltSzoveg = "Lehetséges, hogy csonkolt a név.";
    }

    document.getElementById('negyedikMegoldas').innerHTML = "<strong>Név:</strong> " + tisztaNev + "<br><strong>Állapot:</strong> " + csonkoltSzoveg;
}