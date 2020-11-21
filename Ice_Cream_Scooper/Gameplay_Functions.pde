//initializes values in setup function. //<>//
void initializeValues()
{
  //initialize objects.
  scoreText= new Text(30, 30, 15, "Score: 0   Lives: ", color(0));
  fallenObjectsText=new Text(30, 50, 15, "Fallen ice-cream balls: 1", color(0));

  catcher= new Image(width/2, 550, 150, 50, "cone.png");
  collectible= new Image(350, 50, 40, 40, "ball1.png");
  heart= new Image(80, 25, 30, 30, "hearts.png"); 
  backgroundImage= new Image(400, 300, 800, 600, "background.png");  

  missed= new Music();
  caught= new Music();
  backgroundMusic= new Music();

  caught.load("caught sound.mp3");
  missed.load("missed sound2.mp3");

  backgroundMusic.load("background music2.mp3");
  backgroundMusic.loop=true;
  backgroundMusic.play();

  //initialize variables
  score=0;
  lives=3;
  xSpeed=0;
  threshold=10;
  startScreenTime=millis();
  numberOfIcecreamDropped=1;
  difficultyMultiplier=1;
  superCheatIndex=1;
  heartCheatIndex=1;
  secretCheatFlag= false;

  startScreenOn=true;

  //setting image to be drawn from the center.
  imageMode(CENTER);

  startSplash();
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//main game loop. in charge of running the game itself.
void playGame()
{
  backgroundImage.draw();
  scoreText.draw();
  fallenObjectsText.draw();
  catcher.draw();

  moveCatcher();
  drawAndMoveCollectible();
  detectCollision();

  drawIcecream();
  drawLives();

  detectWinOrLose();
  
  handleDifficulty();
  handleCheatCode();
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/
void instantiateNewCollectible() //creates a new collectible
{
  updateNumberOfBalls();

  if (collectible!=null)
    return;

  //randomizing the color of the icecream ball and its horizontal spawn location
  String[] collectibles={"ball1.png", "ball2.png", "ball3.png", "ball4.png", "ball5.png"};
  int selection= (int) random(0, 5);

  int x= clamp((int) (Math.random()*(width))+100, 20, 750);

  collectible=new Image(x, 100, 40, 40, collectibles[selection]);
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//checks for collision between collectible, the catcher and the bottom of the screen
void detectCollision()
{
  if (collectible==null)
    return; 

  //variables for determening the current boundries of the collectible and the catcher
  int collectibleRight=collectible.x+collectible.width/2; //right edge of collectible
  int collectibleLeft= collectible.x-collectible.width/2; //left edge of collectible
  int collectibleBottom=collectible.y+collectible.height/2; //bottom edge of collectible
  int catcherRight =catcher.x+catcher.width/2; //right edge of catcher
  int catcherLeft= catcher.x-catcher.width/2; //left edge of catcher
  int catcherTop= catcher.y-catcher.height/2; //top edge of catcher

  //if the collectible is touching the catcher, destroy the collectible,
  //update the score, play the caught sound effect and create new collectible.
  if  (((collectibleRight>=catcherLeft&&collectibleRight<=catcherRight) 
    || (collectibleLeft>=catcherLeft && collectibleLeft<=catcherRight))
    && (collectibleBottom>=catcherTop))
  {
    collectible=null;
    instantiateNewCollectible();
    updateScore();
    caught.play();
  }

  //else, if collectible has reached the bottom of the screen, destroy the collectible,
  //update life points, play missed sound effect and create new collectible.
  else if (collectible.y>=height)
  {
    collectible=null;
    updateLife(); 
    missed.play();
    instantiateNewCollectible();
  }
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//if an arrow key is pressed, check which one and change the value of xSpeed.
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

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

//clamps a value to be between a given minimum and maximum
int clamp(int value, int min, int max)
{
  if (value<=min)
    value=min;

  else if (value>=max)
    value=max;

  else {
  } 
  return value;
}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

void detectWinOrLose()
{
  if (numberOfIcecreamDropped>=10)
  {
    if (score>=7)
      gameState="winState";

    else
      gameState=("lostState");
  }
}

void handleDifficulty()
{
  if (score>=5)
  difficultyMultiplier=1;
}

void handleCheatCode()
{
  char[] heartCheat = {'h','e','a','r','t'};

  //handle super cheat code.
  char[] superCheat = {'s','t','a','r','t','e','c','h'};
  
   if (!(superCheatIndex>=superCheat.length+1))
 {
  if (key==superCheat[superCheatIndex-1])
  superCheatIndex++;
 }
 
   if (superCheatIndex>=superCheat.length+1)
    secretCheatFlag=true;
 
 
 
 //handle heart cheat code.
  if (key==heartCheat[heartCheatIndex-1])
  heartCheatIndex++;
  
  if (heartCheatIndex>=heartCheat.length+1)
  {
    System.out.println("lives added");
    lives+=1;
    heartCheatIndex=1;
  }
  
}
