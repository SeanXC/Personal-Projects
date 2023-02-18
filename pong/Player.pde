class Player {
  float xpos;
  float ypos;
  int i=3;
  int k=3;
  float cmpX;
  float peformWell;

  color paddlecolor = color(200, 100, 0);
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  void move(float x) {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  void draw()
  {
    if (cmpX+PADDLEWIDTH/2<theBall.x) cmpX+=2;
    if (cmpX+PADDLEWIDTH/2>theBall.x) cmpX-=2; //<>//
    //
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
    if ((theBall.y>=SCREENY)&&(i>0))
      i--;
    if ((theBall.y<=0)&&(k>0))
      k--;
    text("Your lives: "+i, 0, SCREENY-40);
    text("PC lives: "+k, 0, 40);
  }

  void resetLives() {
    fill(250, 250, 250);
    if (thePlayer.i==0)
      text("Game Over!", m++, 120);
    if (thePlayer.k==0)
      text("You win!", m++, 120);
  }
  void pPos(){ 
    float distance;
    distance=SCREENX-xpos;
    if(distance>(SCREENX-xpos)){
    theBall.dy+=10;
    }
    if(distance<(SCREENX-xpos))
    {
    theBall.dy-=10;
    }

    
  }
}
