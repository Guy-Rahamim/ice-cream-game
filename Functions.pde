
/************************* void instantiateCollectible() **********************/
void instantiateNewCollectible()
{
   if (collectible!=null)
   return;
   
     String[] collectibles={"ball1.png","ball2.png","ball3.png","ball4.png","ball5.png"};
   int x= clamp((int) (Math.random()*(width))+100,20,750);
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
//  int catcherBottom= catcher.y+catcher.height/2; //bottom edge of catcher
  
  if (((collectibleRight>=catcherLeft&&collectibleRight<=catcherRight) || (collectibleLeft>=catcherLeft && collectibleLeft<=catcherRight))
  &&collectibleBottom>=catcherTop)
  {
   collectible=null;
   instantiateNewCollectible();
    updateScore();
    caught.play();
  }
  
  if (collectible.y>=height)
  {
    collectible=null;
    updateLife(); 
    missed.play();
    instantiateNewCollectible();
  }
}

void moveCatcher()
{ catcher.x= clamp(catcher.x+xSpeed, catcher.width/2, width-catcher.width/2);  } //<>//


void keyPressed()
{
  
  
  switch(keyCode)
  {
    case RIGHT:
    xSpeed=10;
    break;
    
    case LEFT:
    xSpeed=-10;
    break;
    
    case UP:
    xSpeed=0;
    break;
    
    
  }

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
  splash.GameName="Ice-cream Scooper";
  splash.backgroundColor= color(255,0,0);
  splash.GameAuthor1="GUY";
  splash.GameAuthor2="";
  splash.GameAuthor3="";
  splash.Image="obj.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
    splash.imageX=width/2;
  splash.imageY=height/2;
  splash.Show();
}

void loseSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="You lost!";
  splash.backgroundColor= color(255,0,0);
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

void winSplash()
{
  SplashScreen splash= new SplashScreen();
  splash.GameName="You Won!";
  splash.backgroundColor= color(255,0,0);
  splash.GameAuthor1="Guy";
  splash.GameAuthor2="";
  splash.GameAuthor3="";
  splash.Image="win icecream.png";
  Music muse= new Music();
  muse.path="music.mp3";
  splash.IntroMusic=muse;
    splash.imageX=width/2;
  splash.imageY=height/2;
  splash.Show();
  //drawWinIcecrem();
 
}

void drawWinIcecrem()
{
  int middleX=width/2;
  int middleY=(height/2)+150;
  
    onCone= new Image2(middleX,middleY,150,50,"cone.png");
    onCone.draw();
     onCone=new Image2(middleX,middleY-55,40,40,"icecream3.png");
       onCone.draw();
    onCone= new Image2(middleX+25,middleY-55,40,40,"icecream2.png");
  onCone.draw();
  onCone=new Image2(middleX-25,middleY-55,40,40,"icecream4.png");
  onCone.draw();
     onCone= new Image2(middleX,middleY-35,40,40,"icecream1.png");
 onCone.draw();
 onCone= new Image2(middleX-40,middleY-35,40,40,"icecream2.png");
 onCone.draw();
  onCone= new Image2(middleX+40,middleY-35,40,40,"icecream3.png");
 onCone.draw();
  onCone= new Image2(middleX+25,middleY-30,40,40,"icecream4.png");
 onCone.draw();
  onCone= new Image2(middleX-25,middleY-30,40,40,"icecream5.png");
 onCone.draw();
   onCone= new Image2(middleX-20,middleY-100,40,80,"fireworks.png");
  onCone.rotation=-30;
  onCone.draw();
   onCone= new Image2(middleX,middleY-90,75,70,"whippedcream.png");
  onCone.draw();
}

void playGame()
{
  background.draw();
  moveCatcher();
  collectibleMovementAndDrawing();
  collisionDetection();
  scoreText.draw();
  catcher.draw();
  drawIcecream();
  drawLives();
}
