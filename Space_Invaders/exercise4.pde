Alien theAliens[];
// add code to declare a variable of type Player.
Player thePlayer;
// add code to declare a variable of type Bullet.
ArrayList<Bullet> theBullet;
PowerUp thePowerUp[];
void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  PImage normalAlienImg, explodeAlienImg;
  normalAlienImg = loadImage("invader.GIF");
  explodeAlienImg = loadImage("exploding.GIF");
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theAliens = new Alien[10];
  thePowerUp = new PowerUp[10];
  theBullet = new ArrayList<Bullet>();
  init_aliens(theAliens, normalAlienImg, explodeAlienImg);
  init_powerUp(thePowerUp);
  // add code to create a new Player object.
}

void init_aliens(Alien baddies[], PImage baddy, PImage explode) {
  for (int i=0; i<baddies.length; i++) {
    baddies[i] = new Alien(MARGIN+i*(baddy.width+GAP), MARGIN, baddy, explode);
  }
}
void init_powerUp(PowerUp pus[]) {
  for (int i=0; i<pus.length; i++) {
    pus[i] = new PowerUp(thePlayer.xpos, thePlayer.ypos);
  }
}

void draw() {
  background(0);
  // Add code to ask player to move itself.
  thePlayer.move(mouseX);
  // Add code to ask player to draw itself.
  thePlayer.draw();
  // Add code to move and draw a bullet if one exists
  //(i.e. the bullet is not a null pointer).
  for (int i=0; i<thePowerUp.length; i++)
  {
    thePowerUp[i].move();
    thePowerUp[i].draw();
    thePowerUp[i].collisions(thePlayer);
  }
  for (int i=0; i<theAliens.length; i++) {
    theAliens[i].move();
    theAliens[i].draw();
    //theBullet.collisions(theAliens[i]);
    //if (theBullet.cls=1) theAliens[i].die();
  }
  for (Bullet aBlt : theBullet)
  {
    aBlt.move();
    aBlt.draw();
    for (int i=0; i<theAliens.length; i++) {
      aBlt.collisions(theAliens[i]);
      if (aBlt.cls) {
        theAliens[i].die();
            thePowerup [i] = new PowerUp(thePlayer.xpos, thePlayer.ypos);

      }
    }
  }
}
void mousePressed() {
  theBullet.add(new Bullet(thePlayer.xpos, thePlayer.ypos));
}
// Add mousePressed() method to create a bullet when the mouse is pressed.
