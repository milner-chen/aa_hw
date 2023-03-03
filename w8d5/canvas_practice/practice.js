document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById("mycanvas");
    canvas.width = 500;
    canvas.height = 500;
    let ctx = canvas.getContext('2d');
    ctx.fillStyle = "lightblue";
    ctx.fillRect(20, 30, 40, 50);
});
