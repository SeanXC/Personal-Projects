class Bullet {
  int x, y;
  int speed;
  int size;
  int left, right, top, bottom;
  boolean cls;

  Bullet(int iniX, int iniY) {
    x = iniX;
    y = iniY;
    size = 15;
    speed = 6;
  }
  void move() {
    y -= speed;
    left=x;
    right=x+size;
    top=y;
    bottom=y+size;
  }
  void draw() {
    fill(0, 250, 250);
    ellipse(x, y, size, size);
  }
  void collisions(Alien ali)
  {
    cls=false;
    if ((top<=(ali.y+26))&&
      (bottom>=ali.y)&&(left<=(ali.x+29))&&(right>=ali.x))
    {
      cls = true;
      print(" one alien died ");
    }
  }
}
