  class Player {
    /* Insert your code from week 2 here to begin with, again you need
     to remember the position and appearance of the Player, a constructor,
     methods to move the player, and to draw the player */
    int xpos;
    int ypos;
    color paddlecolor = color(255);
    Player(int screen_y)
    {
      xpos=SCREENX/2;
      ypos=screen_y;
    }
    void move(int x) {
      if (x>SCREENX-PADDLEWIDTH) xpos= SCREENX-PADDLEWIDTH/2;
      else xpos=x;
    }
    void draw()
    {
      fill(paddlecolor);
      rect(xpos-PADDLEWIDTH/2, ypos, PADDLEWIDTH, PADDLEHEIGHT);
    }
  }
