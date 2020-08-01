
/************************* void instantiateCollectible() **********************/
void instantiateNewCollectible()
{
   if (collectible!=null)
   return;
   
     String[] collectibles={"ball1.png","ball2.png","ball3.png","ball4.png","ball5.png"};
   int x= clamp((int) (Math.random()*(width-100))+100, 100,600);
   int selection= (int) random(0,5);
   System.out.println(selection);
   collectible=new Image2(x,100,40,40,collectibles[selection]); 
}

void collectibleMovementAndDrawing()
{
  if (collectible==null)
  return;
  
  collectible.y+=6.5;
     collectible.draw();
}

/**************************************************************************/
/************************* void collisionDetection() **********************/
void collisionDetection()
{
   if (collectible==null)
   return; 
   

  int collectibleRight=collectible.x+collectible.width/2; //right edge of collectible
  int collectibleLeft= collectible.x-collectible.width/2; //left edge of collectible
  int collectibleBottom=collectible.y+collectible.height/2; //bottom edge of collectible
  int catcherRight =catcher.x+catcher.width/2; //right edge of catcher
  int catcherLeft= catcher.x-catcher.width/2; //left edge of catcher
  int catcherTop= catcher.y-catcher.height/2; //top edge of catcher
  int catcherBottom= catcher.y+catcher.height/2; //bottom edge of catcher
  
  if (((collectibleRight>=catcherLeft&&collectibleRight<=catcherRight) || (collectibleLeft>=catcherLeft && collectibleLeft<=catcherRight))
  &&collectibleBottom>=catcherTop)
  {
   collectible=null;
   instantiateNewCollectible();
    updateScore();
  }
  
  if (collectible.y>=height)
  {
    collectible=null;
    updateLife(); 
    instantiateNewCollectible();
  }
}

void moveCatcher()
{ catcher.x= clamp(catcher.x+xSpeed, catcher.width/2, width-catcher.width/2);  } //<>//


void keyPressed()
{
  if (keyCode==RIGHT)
    xSpeed=10;
    
    else if (keyCode==LEFT)
    xSpeed=-10;
   
   else
   xSpeed=0;
}


int clamp(int value, int min, int max)
{
if (value<=min)
value=min;

else if (value>=max)
value=max;

else {} 
return value; 
}


void startSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="fun with iceCream";
  splash.backgroundColor= color(130,255,255);
  splash.GameAuthor1="GUY";
  splash.GameAuthor2="LOTEM";
  splash.GameAuthor3="";
  splash.Image="obj.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
  splash.Show();
}

void loseSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="You lose, better luck next time!";
  splash.backgroundColor= color(130,255,255);
  splash.GameAuthor1="";
  splash.GameAuthor2="";
  splash.GameAuthor3="";
  splash.Image="obj.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
  splash.Show();
}

void winSplash()
{
 
  SplashScreen splash= new SplashScreen();
  splash.GameName="YOU WIN!!";
  splash.backgroundColor= color(130,255,255);
  splash.GameAuthor1="GUY";
  splash.GameAuthor2="LOTEM";
  splash.GameAuthor3="";
  splash.Image="obj.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
  splash.Show();
 
}

void playGame()
{
    background(100);
  moveCatcher();
  collectibleMovementAndDrawing();
  collisionDetection();
  scoreText.draw();
  catcher.draw();
  drawIcecream();
  drawLives();
}
