void gameover() {
  background(backgroundColour);
  fill(255);
  textFont(mainFont);
  text("Game Over", 400, 150);
  
  textSize(30);
  text("You failed to save all the cats D:", 400, 225);
  
  textSize(30);
  text("You survived " + waveCount + " waves", 400, 84);
  
  gameoverExtras();
  grinchy.show();
}

//extra stuff --------------------------------------------------------------------------
void gameoverExtras() {
  retryButton.show();
  if (retryButton.clicked) {
    catCoins = 0;
    gameLives = 9;
    currentSlide = 0;
    waveCount = 0;
    battleMode = false;
    gameMode = 1;
    
    for (int i = 0; i < mobs.size(); i++) {
      mobs.remove(i);
    }
    
    for (int i = 0; i < towers.size(); i++) {
      towers.remove(i);
    }
    
    for (int i = 0; i < fighters.size(); i++) {
      fighters.remove(i);
    }
    for (int i = 0; i < bigBullets.size(); i++) {
      bigBullets.remove(i);
    }
    
    mode = INTRO;
  }
}
