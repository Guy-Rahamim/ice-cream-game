//drawing and moving the collectible object
void drawAndMoveCollectible()
{
  if (collectible==null)
    return;

  collectible.y+=6.5;
  collectible.draw();
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//moves the catcher across the screen, and won't let it move outside the screen
void moveCatcher()
{   catcher.x= clamp(catcher.x+xSpeed, catcher.width/2, width-catcher.width/2);  }

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//updates the score value
void updateScore()
{
  score+=1;   
  scoreText.text="Score: " +score +"   Lives: ";
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

void updateNumberOfBalls()
{
  numberOfIcecreamDropped+=1;
  fallenObjectsText.text="Fallen ice-cream balls: " +numberOfIcecreamDropped;
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//update the life points value
void updateLife()
{
  lives-=1;

  if (lives<=0)
    gameState="loseState";
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//draws the hearts representing the life points
void drawLives()
{
  for (int i=0; i<lives; i++)
  {
    heart.draw();
    heart.x+=30;
  }

  heart.x=scoreText.x+140;
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//draws the stack of icecream balls on the cone
void drawIcecream()
{

  if (score>=2)
  {
    onCone= new Image(catcher.x-40, catcher.y-35, 40, 40, "icecream2.png");
    onCone.draw();
    onCone= new Image(catcher.x+40, catcher.y-35, 40, 40, "icecream3.png");
    onCone.draw();
  }

  if (score>=5)
  {
    onCone= new Image(catcher.x, catcher.y-35, 40, 40, "icecream1.png");
    onCone.draw();
    onCone= new Image(catcher.x-40, catcher.y-35, 40, 40, "icecream2.png");
    onCone.draw();
    onCone= new Image(catcher.x+40, catcher.y-35, 40, 40, "icecream3.png");
    onCone.draw();
    onCone= new Image(catcher.x+25, catcher.y-30, 40, 40, "icecream4.png");
    onCone.draw();
    onCone= new Image(catcher.x-25, catcher.y-30, 40, 40, "icecream5.png");
    onCone.draw();
  }

  if (score>=8)
  {
    onCone=new Image(catcher.x, catcher.y-55, 40, 40, "icecream3.png");
    onCone.draw();
    onCone= new Image(catcher.x+25, catcher.y-55, 40, 40, "icecream2.png");
    onCone.draw();
    onCone=new Image(catcher.x-25, catcher.y-55, 40, 40, "icecream4.png");
    onCone.draw();
    onCone= new Image(catcher.x, catcher.y-35, 40, 40, "icecream1.png");
    onCone.draw();
    onCone= new Image(catcher.x-40, catcher.y-35, 40, 40, "icecream2.png");
    onCone.draw();
    onCone= new Image(catcher.x+40, catcher.y-35, 40, 40, "icecream3.png");
    onCone.draw();
    onCone= new Image(catcher.x+25, catcher.y-30, 40, 40, "icecream4.png");
    onCone.draw();
    onCone= new Image(catcher.x-25, catcher.y-30, 40, 40, "icecream5.png");
    onCone.draw();
  }
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//defines the start splash screen and plays it.
void startSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="Ice Cream Scooper";
  splash.backgroundColor= color(255, 0, 0);
  splash.GameAuthor1="Guy Rahamim";
  splash.GameAuthor2="";
  splash.GameAuthor3="";
  splash.Image="opening image.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
  splash.imageX=width/2;
  splash.imageY=height/2;
  splash.Show();
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//defines the lose splash screen and plays it.
void loseSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="You lost..";
  splash.backgroundColor= color(255, 0, 0);
  splash.GameAuthor1="";
  splash.GameAuthor2="";
  splash.GameAuthor3="";
  splash.Image="lose icecream.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
  splash.imageX=width/2;
  splash.imageY=height/2;
  splash.Show();
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//defines the win spalsh screen and plays it.
void winSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="You Won!";
  splash.backgroundColor= color(255, 0, 0);
  splash.GameAuthor1="";
  splash.GameAuthor2="";
  splash.GameAuthor3="";
  splash.Image="win icecream.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
  splash.imageX=width/2;
  splash.imageY=height/2;
  splash.Show();
}
