class Image {
  PImage name;
  float x, y, w, h;
    
  Image(String i, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    name = loadImage(i);
  }
  
  void show() {
    image(name, x, y, w, h);
  }
}
