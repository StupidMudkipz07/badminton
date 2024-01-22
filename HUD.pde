boolean enableMenu = true;

void enableMenu() {
  fill(160);
  rect(width*0.005, height*0.05, width*0.175, height*0.5);
  fill(0);
  textSize(height/20.571);
  text("Keys", width*0.01, height*0.1);
  textSize(height/36);
  text("S", width*0.01, height*0.14);
  text("singles", width*0.09, height*0.14);
  text("D", width*0.01, height*0.17);
  text("doubles", width*0.09, height*0.17);
  text("A", width*0.01, height*0.20);
  text("mixed", width*0.09, height*0.20);
  text("Leftclick", width*0.01, height*0.23);
  text("move player", width*0.09, height*0.23);
  text("1", width*0.01, height*0.26);
  text("grow player", width*0.09, height*0.26);
  text("2", width*0.01, height*0.29);
  text("shrink player", width*0.09, height*0.29);
}

boolean mousePos() {
  if (key == 't') {
    return true;
  } else {
    return false;
  }
}
void showMousePos() {
  textSize(30);
  text(mouseX, mouseX, mouseY);
  text(mouseY, mouseX, mouseY+30);
}
