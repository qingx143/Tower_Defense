void build() {
  background(grassMode);
  textFont(mainFont);
  drawMap();
  
  textSize(50);
  fill(255, 0, 0);
  text("BUILD MODE", 300, 100);
  
  fill(255);
  textSize(20);
  text("wave " + waveCount, 700, 80);
  
  for (int i = 0; i < towers.size(); i++) {
    towers.get(i).show();
  }
  
  buttonSideBuild();
  endBlockGame();
  tactileBuild();
}

//tactile build ------------------------------------------------------------------------
void tactileBuild() {
  textSize(20);
  fill(255);
  if (gunButton.insideButton(gunButton.x, gunButton.y, gunButton.w, gunButton.h)) {
     text("shoots bullets in", 700, 135);
     text("all four directions", 700, 160);
     if (!(catCoins >= 50))
       text("insufficent funds", 700, 80);
  }
  if (aoEButton.insideButton(aoEButton.x, aoEButton.y, aoEButton.w, aoEButton.h)) {
     text("creates an AoE that", 700, 135);
     text("damages blobs inside", 700, 160);
     if (!(catCoins >= 75))
       text("insufficent funds", 700, 80);
  }
  if (sniperButton.insideButton(sniperButton.x, sniperButton.y, sniperButton.w, sniperButton.h)) {
     text("targets the first", 700, 135);
     text("blob they see", 700, 160);
     if (!(catCoins >= 150))
       text("insufficent funds", 700, 80);
  }
  if (warriorButton.insideButton(warriorButton.x, warriorButton.y, warriorButton.w, warriorButton.h)) {
     text("goes along path in", 700, 125);
     text("reverse and shoots", 700, 150);
     text("in all directions", 700, 175);
     if (!(catCoins >= 200))
       text("insufficent funds", 700, 80);
  }
}

//button side --------------------------------------------------------------------------
void buttonSideBuild() {
  noStroke();
  fill(choicesGrass);
  rect(700, 250, 200, 500);

  //lines
  stroke(#517C58);
  strokeWeight(5);
  line(620, 100, 780, 100);
  line(620, 200, 780, 200);
  line(620, 400, 780, 400);
  line(600, -5, 600, 505);
  
  gunButton.show();
  fill(180);
  if (gunButton.clicked && !(catCoins >= 50))
    fill(255, 0, 0);
  text("$50", gunButton.x + 15, gunButton.y + 25);
  
  aoEButton.show();
  fill(180);
  if (aoEButton.clicked && !(catCoins >= 75))
    fill(255, 0, 0);
  text("$75", aoEButton.x + 15, aoEButton.y + 25);
  
  sniperButton.show();
  fill(180);
  if (sniperButton.clicked && !(catCoins >= 150))
    fill(255, 0, 0);
  text("$150", sniperButton.x + 15, sniperButton.y + 25);
  
  warriorButton.show();
  fill(180);
  if (warriorButton.clicked && !(catCoins >= 200))
    fill(255, 0, 0);
  text("$200", warriorButton.x + 15, warriorButton.y + 25);
  
  buttonChange(nextWaveButton, 4);
  buttonGame();
  
  if (gunButton.clicked && !towerObtained && catCoins >= 50) {
    catCoins -= 50;
    towers.add(new Gun(0, 0));
  }
    
  if (aoEButton.clicked && !towerObtained && catCoins >= 75) {
    catCoins -= 75;
    towers.add(new AoE(0, 0));
  }
 
  if (sniperButton.clicked && !towerObtained && catCoins >= 150) {
    catCoins -= 150;
    towers.add(new Sniper(0, 0));
  }
    
  if (warriorButton.clicked && !towerObtained && catCoins >= 200) {
    fighters.add(new Fighter(0));
    catCoins -= 200;
    for (int i = 0; i < fighters.size(); i++) {
      towers.add(new Fighter(500 + i*(100)));
    }
  }
}
