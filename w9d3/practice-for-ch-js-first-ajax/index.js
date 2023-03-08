console.log("Hello from the console!");

// Your code here
fetch("https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b")
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw response;
        }
    })
    .then(data => {
        console.log("Success!");
        console.log(data);
    })
    .catch(errorResponse => {
        console.log("Failure!");
        console.error(errorResponse);
    });

console.log("The AJAX request has been dispatched.");

// request was sent after everything else in the file was loaded
// response comes back after the request
// current weather in London is: Rain; moderate rain
// page did not refresh
// we could specify the method property in the options