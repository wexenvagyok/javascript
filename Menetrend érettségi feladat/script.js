let fileNev = "vonat.txt";

const adatok = [];

function betolt()
{
    fetch(fileNev)
    .then(x => x.text())
    .then(x =>
        {
            console.log(x);

            let minta = /(\d+)\t(\d+)\t(\d+)\t([IE])/g;

            let sorok = x.match(minta)

            //AI Help
            const regex = /^(?<vonatId>\d+)\s+(?<allomasId>\d+)\s(?<ora>\d+)\s(?<perc>\d+)\s(?<tipus>[IE])$/gm;

            let sorok2 = x.match(regex)

            while((match = regex.exec(x)) !== null)
            {
                adatok.push(match.groups)
                console.log(match.groups)
            }
            
            console.log(adatok)
            
        }
    )
}

document.body.onload = betolt();