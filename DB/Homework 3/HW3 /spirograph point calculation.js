function calculateSpirographPoint(t, R, r, a, center, scale) {
    return {
        lat: center.lat + scale * ((R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t)),
        long: center.long + scale * ((R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t))
    };
}

function generateSpirograph(center, R, r, a, scale, nRev) {
    const spiro = [];
    for (let t = 0.00; t < nRev * Math.PI; t += 0.1) {
        const spiroPoint = calculateSpirographPoint(t, R, r, a, center, scale);
        spiro.push(spiroPoint);
    }
    return spiro;
}

function printSpirograph(spiro) {
    spiro.forEach(point => {
        console.log(`${point.long},${point.lat}`);
    });
}


const center = { long: -118.28544715249919, lat: 34.02057427525238 };
const R = 36;
const r = 9;
const a = 30;
const scale = 0.0003;
const nRev = 16;


const spirographPoints = generateSpirograph(center, R, r, a, scale, nRev);
printSpirograph(spirographPoints);
