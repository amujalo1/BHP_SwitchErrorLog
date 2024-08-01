function HighlightSelectedMenuItems() {
    for (i = 0; i < arguments.length; i++) {
        var menuItem = document.getElementById(arguments[i]);
        if (menuItem !== null) {
            menuItem.style.backgroundColor = "#4040de";  //"darkblue"; //"#357ebd"; //.classList.add('HighLightLink');  4040de
            menuItem.style.color = "yellow";
        }
    }
}