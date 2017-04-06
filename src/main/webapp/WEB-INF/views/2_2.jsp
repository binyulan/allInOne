<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onmousemove="showCordinate(event)" style="margin: 0; padding: 0">
    <canvas id="myCanvas" width="1100" height="600"></canvas>
    <button onclick="draw()"
        style="width: 200px; height: 60px; font-size: 40px; position: absolute; top: 90px; left: 820px;">continue</button>
    <div id="blockLine"
        style="display: none; width: 30px; height: 30px; color: red; border: 1px; position: absolute; left: 340px; background-color: white; top: 150px;"></div>
</body>
<script type="text/javascript">
    var showCordinate = function(e) {
        console.info(e.clientX + ":" + e.clientY);
    }
    var canvas = document.getElementById("myCanvas");
    var context = canvas.getContext("2d");
    var i = 0;
    var debug = false;
    var draw = function () {
        if (i == 0 || debug) {
        	context.rect(100, 100, 220, 260);
        	context.stroke();
        	context.font="30px Arial";
            context.fillText("CPU", 105, 126);
        }
        if (i == 1 || debug) {
            context.rect(110, 140, 60, 40);
            context.stroke();
            context.fillText("AX", 115, 166);
        }
        if (i == 2 || debug) {
        	context.rect(110, 190, 60, 40);
        	context.stroke();
            context.fillText("BX", 115, 216);
        }
        if (i == 3 || debug) {
        	context.rect(110, 240, 60, 40);
        	context.stroke();
            context.fillText("CX", 115, 266);
        }
        if (i == 4 || debug) {
            context.rect(110, 290, 60, 40);
            context.stroke();
            context.fillText("DX", 115, 316);
        }
        if (i == 5 || debug) {
            context.rect(400, 30, 140, 490);
            context.stroke();
            context.fillText("RAM", 405, 56);
        }
        if (i == 6 || debug) {
        	context.moveTo(400, 90);
        	context.lineTo(540, 90);
        	context.moveTo(400, 120);
            context.lineTo(540, 120);
            context.moveTo(400, 150);
            context.lineTo(540, 150);
            context.moveTo(400, 180);
            context.lineTo(540, 180);
            context.moveTo(400, 210);
            context.lineTo(540, 210);
            context.fillText("Stack", 410, 85);
        	context.stroke();
        }
        if (i == 7 || debug) {
            context.fillText("0x0001", 550, 116);
            context.fillText("0x0002", 550, 146);
            context.fillText("0x0003", 550, 176);
            context.fillText("0x0004", 550, 206);
        }
        if (i == 8 || debug) {
            i++;
        }
        if (i == 9 || debug) {
            context.rect(210, 140, 100, 40);
            context.stroke();
            context.fillText("BP", 215, 166);
            context.font="15px Arial";
            context.fillText("0x0001", 245, 175);
        }
        if (i == 10 || debug) {
            context.moveTo(310, 160);
            context.lineTo(400, 105);
            context.stroke();
        }
        if (i == 11 || debug) {
            context.rect(210, 190, 100, 40);
            context.stroke();
            context.font="30px Arial";
            context.fillText("SP", 215, 216);
            context.font="15px Arial";
            context.fillText("0x0001", 245, 225);
        }
        if (i == 12 || debug) {
        	context.moveTo(310, 210);
            context.lineTo(400, 105);
            context.stroke();
        }
        if (i == 13 || debug) {
        	context.clearRect(244, 213, 50, 10);
            context.font="15px Arial";
            context.fillText("0x0004", 245, 225);
            context.moveTo(310, 210);
            context.lineTo(400, 195);
            context.stroke();
            document.getElementById("blockLine").style.display="block";
        }
        if (i == 14 || debug) {
            context.font="30px Arial";
            context.fillText("String s = new String(\"asdf\")", 693, 211);
        }
        if (i == 15 || debug) {
            context.fillText("s", 420, 204);
            context.font="15px Arial";
            context.fillText("0x00A3", 440, 204);
        }
        if (i == 16 || debug) {
            context.moveTo(400, 330);
            context.lineTo(540, 330);
            context.moveTo(400, 360);
            context.lineTo(540, 360);
            context.moveTo(400, 390);
            context.lineTo(540, 390);
            context.moveTo(400, 420);
            context.lineTo(540, 420);
            context.moveTo(400, 450);
            context.lineTo(540, 450);
            context.font="30px Arial";
            context.fillText("0x00A1", 550, 356);
            context.fillText("0x00A2", 550, 386);
            context.fillText("0x00A3", 550, 416);
            context.fillText("0x00A4", 550, 446);
            context.stroke();
            context.fillText("Heap", 410, 320);
            context.font="15px Arial";
            context.fillText("new String(\"asdf\")", 415, 410);
        }
        if (i == 17 || debug) {
            context.moveTo(470, 200);
            context.lineTo(470, 400);
            context.stroke();
        }
        i++;
    }
    
</script>
</html>