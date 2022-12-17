class Mob {
  float x, y, vx, vy, d, speed;
  int lives, maxLives, distBetBar;
  int cooldown, threshold;
  float closestTx, closestTy, closestT;
  
  Image blob;
  
  Mob(float _x, float _y, float _vx, float d_, int l, int max, float s, int dbb, Image image) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = 0;
    d = d_;
    lives = l;
    maxLives = max;
    speed = s;
    distBetBar = dbb;
    cooldown = 0;
    threshold = 200;
    closestTx = 900;
    closestTy = 900;
    closestT = 1300;
    
    if (image == null)
      blob = new Image("images/Blob1.png", x, y, s + 10, s + 10);
    else 
      blob = image;
  }
  
  void show() {
    fill(0, 255, 0);
    noStroke();
    blob.x = x;
    blob.y = y;
    blob.w = d + 10;
    blob.h = d + 10;
    //circle(x, y, d);
    blob.show();
    
    
    //hp stuff
    strokeWeight(1);
    stroke(0);
    fill(#9D9D9D); //grey
    rect(x, y - distBetBar, maxLives, 6);
    rectMode(CORNER);
    fill(255, 0, 0); //red
    noStroke();
    rect(x - maxLives/2, y - distBetBar - 3, lives, 6);
    rectMode(CENTER);
  }
  
  void act() {
    x += vx;
    y += vy;
    if (battleMode) {
      closestT = 1400;
      for (int i = 0; i < towers.size(); i++) {
        if (dist(towers.get(i).x, towers.get(i).y, x, y) < closestT) {
          closestT = dist(towers.get(i).x, towers.get(i).y, x, y);
          closestTx = towers.get(i).x;
          closestTy = towers.get(i).y;
          
        }
      }
      cooldown++;
      if (cooldown >= threshold) {
        cooldown = 0;
        if (towers.size() != 0)
          enemyBullets.add(new EnemyBullet(closestTx, closestTy, 0, 0));
      }
      stroke(0, 0, 255);
      strokeWeight(cooldown/25);
      if (towers.size() != 0)
        line(x, y, closestTx, closestTy);
    }
    
    
    for (int i = 0; i < nodes.length; i++) {
      if (dist(nodes[i].x, nodes[i].y, x, y) <= 0) {
        vx = nodes[i].dx * speed;
        vy = nodes[i].dy * speed;
      }
    }
    
    for (int i = 0; i < bullets.size(); i++) {
      if (dist(bullets.get(i).x, bullets.get(i).y, x, y) <= d/2 + bullets.get(i).d/2 && bullets.get(i) instanceof Bullet) {
        lives -= 5;
        bullets.get(i).lives--;
      }
    }
    
    for (int i = 0; i < bigBullets.size(); i++) {
      if (dist(bigBullets.get(i).x, bigBullets.get(i).y, x, y) <= d/2 + bigBullets.get(i).d/2) {
        lives -= 5;
        bigBullets.get(i).lives--;
      }
    }
    
    if (x == 510) {
      lives = 0;
      gameLives--;
    }
    if (lives == 0 && !battleMode)
      catCoins += 10;
    if (lives == 0 && battleMode)
      catCoins += 30;
  }
}

//speedy mob ---------------------------------------------------------------------------
class SpeedyMob extends Mob {
  SpeedyMob(float x_, float y_) {
    super(x_, y_, 2, 20, 25, 25, 2, 20, new Image("images/Blob2.png", -15, 0, 10, 10));
  }
  
  void show() {
    super.show();
    
  }
  
  void act() {
    super.act();
    if (lives == 0 && !battleMode)
      catCoins += 20;
    if (lives == 0 && battleMode)
      catCoins += 40;
  }
}


//big mob ------------------------------------------------------------------------------
class BigMob extends Mob {
  BigMob(float x_, float y_) {
    super(x_, y_, 0.5, 50, 80, 80, 0.5, 20, new Image("images/Blob3.png", -15, 0, 10, 10));
  }
  
  void show() {
    super.show();
  }
  
  void act() {
    super.act();
    if (lives == 0 && !battleMode)
      catCoins += 15;
    if (lives == 0 && battleMode)
      catCoins += 25;
  }
}
