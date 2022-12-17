class Tower {
  final int PLACING = 0;
  final int PLACED = 1; 
  
  int lives, currentL;
  float x, y, s;
  color c;
  int cooldown, threshold; //smaller threshold, more bullets
  int towerMode;
  int price;
  
  Tower(float _x, float _y, float _s, int thres, color colour, int l, int p) {
    x = _x;
    y = _y;
    s = _s;
    cooldown = 0;
    threshold = thres;
    towerMode = PLACING;
    c = colour;
    lives = l;
    price = p;
    currentL = lives;
  }
  
  void show() {
  }
  
  void act() {
  }
}

//gun class ----------------------------------------------------------------------------
class Gun extends Tower {
  Image gunImage;
  
  Gun(float _x, float _y) {
    super(_x, _y, 40, 60, color(0, 0, 255), 30, 50);
    gunImage = new Image("images/GunImage.png", 700, 250, 70, 70);
  }
  
  void show() {
    if (towerMode == PLACING) {
      strokeWeight(3);
      stroke(255, 0, 0, 80);
      line(mouseX, mouseY, mouseX + 60, mouseY);
      line(mouseX, mouseY, mouseX - 60, mouseY);
      line(mouseX, mouseY, mouseX, mouseY + 60);
      line(mouseX, mouseY, mouseX, mouseY - 60);
    }
    noStroke();
    fill(c);
    if (towerMode == PLACED) {
      square(x, y, s);
      gunImage.show();
    }
    
    else if (towerMode == PLACING) {
      towerObtained = true;
      square(mouseX, mouseY, 40);
      gunImage.show();
      gunImage.x = mouseX;
      gunImage.y = mouseY;
      if (mousePressed && !(mouseX >= 580)) {
        towerObtained = false;
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
    
    if (currentL < lives) {
      //hp stuff
      strokeWeight(1);
      stroke(0);
      fill(#9D9D9D); //grey
      rect(x, y - 30, lives, 6);
      rectMode(CORNER);
      fill(255, 0, 0); //red
      noStroke();
      rect(x - lives/2, y - 30 - 3, currentL, 6);
      rectMode(CENTER);
    }
  }
  
  void act() {
    super.act();
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      
      bullets.add(new Bullet(x, y, 0, 5, 5));
      bullets.add(new Bullet(x, y, 5, 0, 5));
      bullets.add(new Bullet(x, y, 0, -5, 5));
      bullets.add(new Bullet(x, y, -5, 0, 5));
    }
    
    for (int i = 0; i < enemyBullets.size(); i++) {
      if (dist(enemyBullets.get(i).x, enemyBullets.get(i).y, x, y) <= s/2 + enemyBullets.get(i).d/2) {
        currentL -= 10;
        enemyBullets.get(i).lives = 0;
      }
    }
  }
}

//aoe class ----------------------------------------------------------------------------
class AoE extends Tower {
  Image aoEImage;
  
  AoE(float _x, float _y) {
    super(_x, _y, 40, 120, color(0, 0, 255), 50, 75);
    aoEImage = new Image("images/AoEImage.png", 700, 250, 70, 70);
  }
  
  void show() {
    if (towerMode == PLACING) {
      noStroke();
      fill(255, 0, 0, 60);
      circle(mouseX, mouseY, 150);
    }
    noStroke();
    fill(c);
    if (towerMode == PLACED) {
      square(x, y, s);
      aoEImage.show();
    }
    
    else if (towerMode == PLACING) {
      towerObtained = true;
      square(mouseX, mouseY, 40);
      aoEImage.show();
      aoEImage.x = mouseX;
      aoEImage.y = mouseY;
      if (mousePressed && !(mouseX >= 580)) {
        towerObtained = false;
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
    
    if (currentL < lives) {
      //hp stuff
      strokeWeight(1);
      stroke(0);
      fill(#9D9D9D); //grey
      rect(x, y - 30, lives, 6);
      rectMode(CORNER);
      fill(255, 0, 0); //red
      noStroke();
      rect(x - lives/2, y - 30 - 3, currentL, 6);
      rectMode(CENTER);
    }
  }
  
  void act() {
    super.act();
    if (bigBullets.size() == 0 || bigBullets.get(0).lives == 0) {
      cooldown++;
      if (cooldown >= threshold) {
        cooldown = 0;
        bigBullets.add(new BigBullet(x, y));
      }
    }
    
    for (int i = 0; i < enemyBullets.size(); i++) {
      if (dist(enemyBullets.get(i).x, enemyBullets.get(i).y, x, y) <= s/2 + enemyBullets.get(i).d/2) {
        currentL -= 10;
        enemyBullets.get(i).lives = 0;
      }
    }
  }
}

//sniper class -------------------------------------------------------------------------
class Sniper extends Tower {
  Image sniperImage;
  
  Sniper(float _x, float _y) {
    super(_x, _y, 40, 100, color(0, 0, 255), 40, 150);
    sniperImage = new Image("images/SniperImage.png", 700, 250, 70, 70);
  }
  
  void show() {
    noStroke();
    fill(c);
    if (towerMode == PLACED) {
      square(x, y, s);
      sniperImage.show();
    }
    
    else if (towerMode == PLACING) {
      towerObtained = true;
      square(mouseX, mouseY, 40);
      sniperImage.show();
      sniperImage.x = mouseX;
      sniperImage.y = mouseY;
      if (mousePressed && !(mouseX >= 580)) {
        towerObtained = false;
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
    
    if (currentL < lives) {
      //hp stuff
      strokeWeight(1);
      stroke(0);
      fill(#9D9D9D); //grey
      rect(x, y - 30, lives, 6);
      rectMode(CORNER);
      fill(255, 0, 0); //red
      noStroke();
      rect(x - lives/2, y - 30 - 3, currentL, 6);
      rectMode(CENTER);
    }
  }
  
  void act() {
    super.act();
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(mobs.get(0).x, mobs.get(0).y, 0, 5, 5));
    }
    stroke(255, 0, 0);
    strokeWeight(cooldown/25);
    line(x, y, mobs.get(0).x, mobs.get(0).y);
    
    for (int i = 0; i < enemyBullets.size(); i++) {
      if (dist(enemyBullets.get(i).x, enemyBullets.get(i).y, x, y) <= s/2 + enemyBullets.get(i).d/2) {
        currentL -= 10;
        enemyBullets.get(i).lives = 0;
      }
    }
  }
}

//fighter class ------------------------------------------------------------------------
class Fighter extends Tower {
  float vx, vy;
  Image fighterImage;
  
  Fighter(int x_) {
    super(x_, 350, 40, 60, color(0, 0, 255), 40, 200);
    lives = 40;
    vx = -1;
    vy = 0;
    currentL = lives;
    fighterImage = new Image("images/FighterImage.png", 600, 350, 70, 70);
  }
  
  void show() {
    if (towerMode == PLACING) {
      strokeWeight(3);
      stroke(255, 0, 0, 80);
      line(448, 350, 400, 350);
    }
    noStroke();
    fill(0, 0, 255);
    //square(x, y, s);
    fighterImage.x = x;
    fighterImage.show();
    
    if (currentL < lives) {
      //hp stuff
      strokeWeight(1);
      stroke(0);
      fill(#9D9D9D); //grey
      rect(x, y - 30, lives, 6);
      rectMode(CORNER);
      fill(255, 0, 0); //red
      noStroke();
      rect(x - lives/2, y - 30 - 3, currentL, 6);
      rectMode(CENTER);
    }
  }
  
  void act() {
    super.act();
    x += vx;
    y += vy; 
    fighterImage.x += vx;
    fighterImage.y += vy;
    
    if (x < 0 - s/2)
      lives = 0;
    
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, 3, 5));
      bullets.add(new Bullet(x, y, 3, 0, 5));
      bullets.add(new Bullet(x, y, 0, -3, 5));
      bullets.add(new Bullet(x, y, -3, 0, 5));
      
      bullets.add(new Bullet(x, y, 3, 3, 5));
      bullets.add(new Bullet(x, y, -3, -3, 5));
      bullets.add(new Bullet(x, y, 3, -3, 5));
      bullets.add(new Bullet(x, y, -3, 3, 5));
    }
    
    for (int i = nodes.length - 1; i > 0; i--) {
      if (dist(nodes[i].x, nodes[i].y, x, y) <= 0) {
        if (nodes[i].y > nodes[i-1].y) vy = -1; 
        else if (nodes[i].y < nodes[i-1].y) vy = 1;
        else vy = 0;
        
        if (nodes[i].x > nodes[i-1].x) vx = -1;
        else if (nodes[i].x < nodes[i-1].x) vx = 1;
        else vx = 0;
      }
    }
    
    for (int i = 0; i < enemyBullets.size(); i++) {
      if (dist(enemyBullets.get(i).x, enemyBullets.get(i).y, x, y) <= s/2 + enemyBullets.get(i).d/2) {
        currentL -= 10;
        enemyBullets.get(i).lives = 0;
      }
    }
  }
}
