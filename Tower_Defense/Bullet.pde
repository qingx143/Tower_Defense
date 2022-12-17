class Bullet {
  float x, y, vx, vy, d;
  int lives;
  
  Bullet(float _x, float _y, float _vx, float _vy, float _d) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = _d;
    lives = 1;
  }
  
  void show() {
    noStroke();
    fill(255, 0, 0);
    circle(x, y, d);
  }
  
  void act() {
    x += vx;
    y += vy;
  
    if ((x < 0 || x > width || y < 0 || y > height))
      lives = 0;
  }
}

class BigBullet extends Bullet {
  int lives, timer;
  
  BigBullet(float x, float y) {
    super(x, y, 0, 0, 150);
    lives = 1;
    timer = 30;
  }
  
  void show() {
    strokeWeight(2);
    stroke(255, 0, 0);
    fill(255, 0, 0, 80);
    circle(x, y, d);
  }
  
  void act() {
    timer--;
    if (timer <= 0) {
      timer = 30;
      lives = 0;
    }
  }
}

class EnemyBullet extends Bullet {
  int lives;
  
  EnemyBullet(float x, float y, float vx, float vy) {
    super(x, y, vx, vy, 5);
    lives = 1;
  }
  
  void show() {
    super.show();
  }
  
  void act() {
    super.act();
  }
}
