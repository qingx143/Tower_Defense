void clicks() {
  mouseReleased = false; //resets
  if (mousePressed)
    wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
