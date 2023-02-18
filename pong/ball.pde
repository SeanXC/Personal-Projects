class Ball {
  float x;
  float y;
  float dx;
  float dy;
  float speed;
  int radius;
  float dCmpX;
  boolean ifCollided;
  color ballColor = color(0, 250, 250);
  Ball() {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2);
    dy = random(1, 2);
    radius=5;
  }
  void move() {
    x = x+dx;
    y = y+dy;
  }
  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
    fill(255, 255, 255);
    text("speed: "+abs(dy), 0, SCREENY/2);
    if (ifCollided) {
      thePlayer.cmpX+=dCmpX++;
      thePlayer.cmpX-=dCmpX--;
    }
    ifCollided=false;
  }
  void wall() {
    if (x-radius <=0) dx=-dx;
    else if (x+radius>=SCREENX) dx=-dx;
  }
  void collide(Player tp) {

    if (y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT &&
      x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH)
    {
      println("collided!");
      dx=dx+0.5;
      dy=dy+2;
      dy=-dy;
    }
  }
  void reset() {
    if ((y>=SCREENY)||(y<=0)&&(mousePressed != true)) {
      dx=0;
      dy=0;
      x = SCREENX/2;
      y = SCREENY/2;
    }
    if ((dx==0)&&(mousePressed == true))
    {
      dx = random(1, 2);
      dy = random(1, 2);
    }
    theBall.draw();
  }
}
