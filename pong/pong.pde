Player thePlayer;
Ball theBall;
Player theComputer;
PFont myFont;
int m;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  noStroke();
  theComputer = new Player(0);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theBall = new Ball();
  ellipseMode(RADIUS);
  //impoet text font below
  myFont = loadFont("Calibri-18.vlw");
  textFont(myFont);
  m = 0;
}

void draw() {
  background(0);
  theBall.move();
  theBall.wall();
  theComputer.move(thePlayer.cmpX);
  thePlayer.move(mouseX);
  theBall.collide(thePlayer);
  theBall.collide(theComputer);
  theComputer.draw();
  thePlayer.draw();
  theBall.draw();
  theBall.reset();
  thePlayer.resetLives();
  thePlayer.pPos();
}
