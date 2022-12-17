class Node {
  float x, y, dx, dy;
  
  Node(float _x, float _y, float _dx, float _dy) {
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
  }
  
  void show() {
    strokeWeight(3);
    fill(pathColour);
    stroke(pathColour);
    circle(x, y, 10);
    line(x, y, x + dx * 50, y + dy * 50);
  }
}
