// function titleize(names, callback) {
//     return names.map (x => callback(x))
// }

// printCallback = function(x) {
//     return `Mx. ${x} Jingleheimer Schmidt`;
// }

function titleize(names, callback) {
    let titled = names.map (x => `Mx. ${x} Jingleheimer Schmidt`);

    callback(titled);
}

function printCallback(arr) {
    arr.forEach(element => {
        console.log(element)
    });
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));
titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant() {

}