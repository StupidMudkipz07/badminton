PImage court;
String gameMode = "neutral";
boolean leftClick = false;
boolean rightClick = false;
float courtX, courtY, courtWidth, courtHeight;

void setup() {
  fullScreen(P3D);
  //size(2560/4,1440/4);
  frameRate(60);
  players = new ArrayList<Player>();
  court = loadImage("badminton_court.png");
  playerWidth = width/12.8;
  playerHeight = height/7.2;
  playerWidthCap = playerWidth;
  playerHeightCap = playerHeight;
}

void draw() {
  background(220);

  courtX = width*0.2;
  courtY = height*0.01;
  courtWidth = (width/4.115)*3.3;
  courtHeight = (courtWidth/2.026);
  image(court, courtX, courtY, courtWidth, courtHeight);

  if (enableMenu) {
    enableMenu();
  }
  if (mousePos()) {
    showMousePos();
  }
  updatePlayers();
  if (gameMode == "singleShift") {
    players.add(new Player(width*0.35, height*0.27, "male"));
    players.add(new Player(width*0.73, height*0.27, "male"));
    gameMode = "single";
  }
  if (gameMode == "doubleShift") {
    players.add(new Player(width*0.37, height*0.17, "male"));
    players.add(new Player(width*0.74, height*0.17, "male"));
    players.add(new Player(width*0.37, height*0.41, "male"));
    players.add(new Player(width*0.74, height*0.41, "male"));
    gameMode = "double";
  }
  if (gameMode == "mixedShift") {
    players.add(new Player(width*0.37, height*0.17, "female"));
    players.add(new Player(width*0.74, height*0.17, "male"));
    players.add(new Player(width*0.37, height*0.41, "male"));
    players.add(new Player(width*0.74, height*0.41, "female"));
    gameMode = "mixed";
  }
}

void keyPressed() {

  if (key == 's' && gameMode != "single") {
    deletePlayers();
    gameMode = "singleShift";
  }
  if (key == 'd' && gameMode != "double") {
    deletePlayers();
    gameMode = "doubleShift";
  }
  if (key == 'a' && gameMode != "mixed") {
    deletePlayers();
    gameMode = "mixedShift";
  }
  if (key == '1') {
    playerWidth *= 1.05;
    playerHeight *= 1.05;
  }
  if (key == '2') {
    playerWidth *= 0.95;
    playerHeight *= 0.95;
  }
  if (key == 'r') {
    playerWidth = playerWidthCap;
    playerHeight = playerHeightCap;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    leftClick = true;
  }

 

  /* if (rightClick == true && mouseButton == RIGHT) {
    rightClick = false;
  }*/
}
void mouseReleased() {
  if (mouseButton == LEFT) {
    leftClick = false;
  }
}
void mouseClicked() {
    if (!rightClick && mouseButton == RIGHT) {
    rightClick = true;
  }
}
