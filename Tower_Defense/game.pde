void game() {
  background(grassMode);
  textFont(mainFont);
  drawMap();
  
  buttonGame();
  
  endBlockGame();
  buttonSide();
  
  fill(255);
  textSize(20);
  text("wave " + waveCount, 700, 80);
  
  if (catCoins >= 500 && mobs.size() != 0) {
    wipeout.show();
    if (wipeout.insideButton(530, 30, 100, 30)) {
      fill(255);
      textSize(20);
      text("$500", 450, 30);
    }
    if (wipeout.clicked) {
      catCoins -= 500;
      for (int i = 0; i < mobs.size(); i++) {
        mobs.get(i).lives = 0;
      }
    }
  }
  
  if (gameLives <= 0)
    mode = GAMEOVER;
    
  if (gameLives == 9) {
    catsLeft8.show();
    extraCat.show();
  }
  if (gameLives == 8)
    catsLeft8.show();
  if (gameLives == 7)
    catsLeft7.show();
  if (gameLives == 6)
    catsLeft6.show();
  if (gameLives == 5)
    catsLeft5.show();
  if (gameLives == 4)
    catsLeft4.show();
  if (gameLives == 3)
    catsLeft3.show();
  if (gameLives == 2)
    catsLeft2.show();
  if (gameLives == 1)
    catsLeft1.show();
}

//draw map -----------------------------------------------------------------------------
void drawMap() {
  path();
  animateGame();
  
  if (fighters.size() > 0) {
    fill(255);
    textSize(20);
    text("fighters: " + fighters.size(), 525, 420);
  }
  
  fill(255);
  textSize(20);
  text("cats left = " + gameLives, 75, 475);
  
  if (gameMode == 1) {
    for (int i = 0; i < nodes.length; i++) {
      nodes[i] = nodes1[i];
    }
  }
  
  if (gameMode == 2) {
    for (int i = 0; i < nodes.length; i++) {
      nodes[i] = nodes2[i];
    }
  }
}

//paths --------------------------------------------------------------------------------
void path() {
  stroke(pathColour);
  strokeWeight(25);
  if (gameMode == 1) {
    line(0, 200, 100, 200);
    line(100, 200, 100, 400);
    line(100, 400, 250, 400);
    line(250, 400, 250, 100);
    line(250, 100, 500, 100);
    line(500, 100, 500, 200);
    line(500, 200, 350, 200);
    line(350, 200, 350, 350);
    line(350, 350, 450, 350);
  }
  
  if (gameMode == 2) {
    line(0, 200, 100, 200);
    line(100, 200, 100, 50);
    line(100, 50, 500, 50);
    line(500, 50, 500, 150);
    line(500, 150, 300, 150);
    line(300, 150, 300, 450);
    line(300, 450, 150, 450);
    line(150, 450, 150, 350);
    line(150, 350, 450, 350);
  }
  
  //nodes
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].show();
  }
}

//animation ----------------------------------------------------------------------------
void animateGame() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.lives <= 0) 
      mobs.remove(i);
    else
      i++;
  }
  
  i = 0;
  while (i < bullets.size()){
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.lives <= 0 || mobs.size() == 0) 
      bullets.remove(i);
    else
      i++;
  }
  
  i = 0;
  while (i < bigBullets.size()){
    BigBullet myBigBullet = bigBullets.get(i);
    myBigBullet.act();
    myBigBullet.show();
    if (myBigBullet.lives <= 0 || mobs.size() == 0) 
      bigBullets.remove(i);
    else
      i++;
  }
  
  i = 0;
  while (i < enemyBullets.size()){
    EnemyBullet myEnemyBullet = enemyBullets.get(i);
    myEnemyBullet.act();
    myEnemyBullet.show();
    if (myEnemyBullet.lives <= 0 || towers.size() == 0) 
      enemyBullets.remove(i);
    else
      i++;
  }
  
  i = 0;
  while (i < towers.size()) {
    if (mobs.size() > 0) {
      towers.get(i).act();
    }
    towers.get(i).show();
    if (towers.get(i).currentL <= 0) {
      if (towers.get(i) instanceof Fighter) {
        fighters.remove(0);
      }
      towers.remove(i);
    }
    else
      i++;
  }
}

//buttons in game ----------------------------------------------------------------------
void buttonGame() {
  if (nextWaveButton.clicked && mobs.size() <= 0) {
    waveCount++;
    if (waveCount > 3) {
      for (int i = 0; i < waveCount / 3; i++) {
        mobs.add(new SpeedyMob(i * (-50), 200));
      }
    }
    
    for (int i = 0; i <= waveCount - 1; i++) {
      mobs.add(new Mob(i * (-50), 200, 1, 30, 40, 40, 1, 25, new Image("images/Blob1.png", -15, 0, 10, 10)));
    }
    
    if (waveCount > 5) {
      for (int i = 0; i < waveCount / 5; i++) {
          mobs.add(new BigMob(i * (-70), 200));
        }
    }
  }
}

//button side --------------------------------------------------------------------------
void buttonSide() {
  noStroke();
  fill(choicesGrass);
  rect(700, 250, 200, 500);
  
  //text
  fill(255);
  textSize(20);
  text("cats left:", 700, 220);
  
  //lines
  stroke(#517C58);
  strokeWeight(5);
  line(620, 100, 780, 100);
  line(620, 200, 780, 200);
  line(620, 400, 780, 400);
  line(600, -5, 600, 505);
  
  nextWaveButton.show();
  buildButton.show();
  if (mobs.size() <= 0)
    buttonChange(buildButton, 5);
}

//end game -----------------------------------------------------------------------------
void endBlockGame() {
  catBase.show();
}
