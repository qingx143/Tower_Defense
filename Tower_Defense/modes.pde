void modes() {
  background(backgroundColour);
  textFont(mainFont);
  
  fill(255);
  noStroke();
  
  mode1Button.show();
  mode2Button.show();
  if (mode1Button.clicked) {
    gameMode = 1;
    mode = GAME;
  }
  if (mode2Button.clicked) {
    gameMode = 2;
    mode = GAME;
  }
}

void instructions() {
  background(backgroundColour);
  textFont(mainFont);
  
  noStroke();
  fill(buttonBase);
  rect(width/2, 285, 500, 300, 20);
  
  textSize(40);
  fill(255);
  text("Welcome to Cat Defense!", width/2, 100);
  left.show();
  right.show();
  
  //buttons
  if (left.clicked && currentSlide >= 1)
    currentSlide--;
    
  if (right.clicked && currentSlide <= 4) 
    currentSlide++;
  
  textSize(25);
  if (currentSlide == 0) {
    text("The cats need your help!", width/2, 230);
    text("Evil beans are coming to catnap them", width/2, 280);
    text("and they must be defeated!", width/2, 330);
  }
  if (currentSlide == 1) {
    textSize(25);
    text("Protect the cats!", width/2, 180);
    textSize(20);
    cat1.show();
    text("Grinchy", 250, 300);
    cat2.show();
    text("Qingling", 350, 300);
    cat3.show();
    text("Banana", 450, 300);
    cat4.show();
    text("Treecia", 550, 300);
    cat5.show();
    text("Casther", 200, 410);
    cat6.show();
    text("Em the Cat", 300, 410);
    cat7.show();
    text("Catlynn", 400, 410);
    cat8.show();
    text("Madicat", 500, 410);
    cat9.show();
    text("Steve", 600, 410);
  }
  
  if (currentSlide == 2) {
    textSize(25);
    text("Defeat the beans!", 400, 180);
    
    textSize(17);
    blob1.show();
    text("Normal Bean: tries", 250, 350);
    text("to steal the cats", 250, 380);
    
    blob2.show();
    text("Speedy Bean: steals", 400, 370);
    text("cats quickly", 400, 400);
    
    blob3.show();
    text("Formal Bean: steals", 550, 350);
    text("cats elegantly", 550, 380);
  }
  
  if (currentSlide == 3) {
    textSize(25);
    text("Use the towers!", 400, 180);
    
    textSize(20);
    gunImage.show();
    text("Gun Tower", 250, 300);
    aoEImage.show();
    text("AoE Tower", 450, 300);
    sniperImage.show();
    text("Sniper Tower", 350, 400);
    fighterImage.show();
    text("Fighter Tower", 550, 400);
  }
  
  if (currentSlide == 4) {
    textSize(25);
    text("Choose a map:", 400, 180);
    map1Button.show();
    if (map1Button.clicked)
      gameMode = 1;
      
    map2Button.show();
    if (map2Button.clicked)
      gameMode = 2;
      
    map1.show();
    map2.show();
    
    if (gameMode == 1)
      map1Button.border = 255;
    else map1Button.border = buttonBorder;
    if (gameMode == 2)
      map2Button.border = 255;
    else map2Button.border = buttonBorder;
  }
  
  if (currentSlide == 5) {
    textSize(25);
    text("Thank you for choosing to save the cats!", 400, 200);
    if (battleMode) {
      text("The cats have given you $300!", 400, 240);
      catCoins = 300;
    }
    else {
      text("The cats have given you $100!", 400, 240);
      catCoins = 100;
    }
    mode1Button.show();
    if (mode1Button.clicked)
      battleMode = false;
    mode2Button.show();
    if (mode2Button.clicked)
      battleMode = true;
      
    if (!battleMode) {
      mode1Button.border = 255;
      textSize(20);
      text("defend the cats by placing towers", 400, 360);
      text("to stun the beans", 400, 390);
    }
    else mode1Button.border = buttonBorder;
    
    if (battleMode) {
      mode2Button.border = 255;
      textSize(20);
      text("defend the cats by placing towers,", 400, 360);
      text("but beans can fight back too!", 400, 390);
    }
    else mode2Button.border = buttonBorder;
    
    
    buttonChange(start, 4);
  }
  
  text((currentSlide + 1) + "/6", 615, 160);
   
  /*
  slide 1:
    The cats need your help! Evil beans are coming to catnap them and they must be defeated!
  slide 2:
    Meet the cats:
  slide 3:
    Meet the beans:
  slide 4:
    Meet the towers:
  slide 5:
    Choose a map and mode to begin!
  slide 6:
    Thank you for choosing to save the cats! Here is a generous donation from the cats themselves
  */
}
