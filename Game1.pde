//initialize global objects
Text scoreText;
Image2 catcher;
Image2 collectible; 
Image2 heart;
Image2 background;
Image2 onCone;
     
//initialize global variables
int xSpeed=0;
int score=0;
int lives=3;
int winThreshold=10;
String gameState="startScreen";
int startScreenTime;
boolean startScreenOn=true;

void setup()
{
  startScreenTime=millis();
  //setting canvas size.
    size(800,600);
  
  //initialize objects.
  catcher= new Image2(width/2,600,150,50,"cone.png");
  collectible= new Image2(350,50,40,40,"ball1.png");
  scoreText= new Text(30,30,15,"Score: 0   Lives: ", color(255,255,255));
  heart= new Image2(80,25,30,30,"hearts.png"); 
  background= new Image2(0,0,600,800,"background.png");  
  //setting rect and image to be drawn from the center.
  rectMode(CENTER);
  imageMode(CENTER);

startSplash();
}


void draw()
{
  if (millis()>startScreenTime+5000 && startScreenOn)
  {
    startScreenOn=false;
  gameState="game";
  }
  
  switch(gameState)
  {
   case "game":
   playGame();
   break;
   
   case "loseState":
   background(100);
   loseSplash();
   break;
   
   case "winState":
   background(100);
   winSplash();
   break;
  }
  
  }
