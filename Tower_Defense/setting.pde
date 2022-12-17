void setting() {
  background(backgroundColour);
  textFont(mainFont);
  
  fill(255);
  textSize(100);
  text("Settings", 400, 100);
  
  baseSettings();
}

//settings base ------------------------------------------------------------------------
void baseSettings() {
  noStroke();
  fill(buttonBase);
  rect(400, 250, 600, 100, 30);
  rect(400, 375, 600, 100, 30);
}
