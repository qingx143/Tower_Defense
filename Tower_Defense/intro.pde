void intro() {
  background(backgroundColour);
  fill(255);
  textFont(mainFont);
  
  text("Cat Defense", 400, 150);
  showIntro();
}

void showIntro() {
  introImage.show();
  buttonChange(playButton, 7);
  introGif.show();
}
