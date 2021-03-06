//declaring global objects
Text scoreText;
Text fallenObjectsText;

boolean secretCheatFlag;

Image catcher; //the catching object
Image collectible; //the caught object
Image heart; //the representation of the life points
Image backgroundImage; //the background image
Image onCone; //the object used for drawing the icecream balls on the cone.

Music caught; //sound effect for catching.
Music missed; //sound effect for missing
Music backgroundMusic; // background music

String gameState="startScreen"; // variables for determining the current game state.

//declaring global variables
int score; //variable for tracking score
int lives; //variable for tracking life points
int xSpeed; //horizontal speed of the icecream cone
int startScreenTime; //length of the start screen
int threshold; //maximum number of falling objects
int numberOfIcecreamDropped; // number of catched objects.
int difficultyMultiplier; // speed multiplier for catcher and collectibles.
int superCheatIndex; //handles super cheat input.
int heartCheatIndex; // handles heart cheat input

boolean startScreenOn; //determines if the start screen should continue appearing

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

void setup()
{ 
  //setting canvas size.
  size(800, 600);

  //calling the value initializer function
  initializeValues();

}

/***************************************************************************/
/***************************************************************************/
/***************************************************************************/

void draw()
{
  drawMenu();
  
  switch(gameState) //choosing what happends for each game state.
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
