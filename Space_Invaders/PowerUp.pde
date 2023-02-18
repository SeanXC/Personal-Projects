class PowerUp
{
  int xpu, ypu;
  int speedPU;
  int sizeL;
  int leftpu, rightpu, toppu, bottompu;
  boolean pu = false;
  PowerUp (int iniXpu, int iniYpu)
  {
    xpu = iniXpu;
    ypu = iniYpu;
    sizeL = 15;
    speedPU = 5;
  }
  void move() {
    ypu += speedPU;
    leftpu=xpu;
    rightpu=xpu+sizeL;
    toppu=ypu;
    bottompu=ypu+sizeL;
  }
  void draw() {
    fill(250, 250, 250);
    rect(xpu, ypu, sizeL, sizeL);
  }
  void collisions(Player pl)
  {
    pu=false;
    if ((toppu<=(pl.ypos+PADDLEHEIGHT))&&
      (bottompu>=pl.ypos)&&(leftpu<=(pl.xpos+PADDLEWIDTH))&&(rightpu>=pl.xpos))
    {
      pu = true;
      print(" powerUp ");
    }
  }
}
