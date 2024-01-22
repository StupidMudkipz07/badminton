ArrayList<Player> players;
float playerWidth, playerHeight, playerWidthCap, playerHeightCap;

class Player {
  float x, y;
  float w, h;
  PImage man_standing, woman_standing, man_smashing, woman_smashing;
  String gender;
  boolean marked;
  float dismax = (w/2+h/2)/2;
  float dis = dist(x+w/2, y+h/2, mouseX, mouseY);

  Player(float x, float  y, String gender) {
    this.x =  x;
    this.y =  y;
    man_standing = loadImage("man_standing.png");
    woman_standing = loadImage("woman_standing.png");
    this.gender = gender;
  }
  void update() {
    playerWidth= constrain(playerWidth, playerWidthCap/2.5, playerWidthCap*2.5);
    playerHeight = constrain(playerHeight, playerHeightCap/2.5, playerHeightCap*2.5);
    w = playerWidth;
    h = playerHeight;

    dis = dist(x+w/2, y+h/2, mouseX, mouseY);

    if (leftClick && dis <= dismax) {
      dismax = width;
      w *= 1.1;
      h *= 1.1;
      x = mouseX - w/2;
      y = mouseY - h/2;
      x = constrain(x, courtX, courtX+courtWidth-w);
      y = constrain(y, courtY, courtY+courtHeight-h);
    } else {
      dismax = (w/2+h/2)/2;
    }

    if (rightClick && dis <= dismax) {
      dismax = width;
      w *= 1.1;
      h *= 1.1;
      marked = true;
      
    } else {
      dismax = (w/2+h/2)/2;
      marked = false;
    }

    if (gender == "female" ) {
      image(woman_standing, x, y, w, h);
    } else {
      image(man_standing, x, y, w, h);
    }
    if (x > 1508){
     
      /* translate(x+w/2, y+h/2);
       rotateY(radians(180));
       translate(x-w*2, y-h*2);*/
    }
  }
}

void updatePlayers() {
  for (int i = players.size() - 1; i >= 0; i--) {
    Player player = players.get(i);
    player.update();
    if (player.x > width) {
      players.remove(i);
    }

/*    if (rightClick && player.dis <= player.dismax) {
      player.dismax = width;
      player.w *= 1.1;
      player.h *= 1.1;
      player.x = mouseX - player.w/2;
      player.y = mouseY - player.h/2;
      player.x = constrain(player.x, courtX, courtX+courtWidth-player.w);
      player.y = constrain(player.y, courtY, courtY+courtHeight-player.h);
    } else {
      player.dismax = (player.w/2+player.h/2)/2;
    }*/
  }
  for (Player players : players) {
    players.update();
  }
}

void deletePlayers() {
  for (Player player : players) {
    player.x = width + 1;
  }
}
