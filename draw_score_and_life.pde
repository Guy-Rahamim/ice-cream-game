/************************* void updateScore() **********************/
void updateScore()
{
  score+=1; 
  if (score>=winThreshold)
  gameState="winState";
  
  scoreText.text="Score: " +score +"   Lives: ";
}


void updateLife()
{
  lives-=1;
  
  if (lives<=0)
  gameState="loseState";
}

void drawLives()
{
   for (int i=0; i<lives; i++)
 {
   heart.draw();
   heart.x+=30;
 }
 heart.x=scoreText.x+140;
}

void drawIcecream()
{

  if (score>=2)
  {

 //onCone= new Image2(catcher.x,catcher.y-35,40,40,"icecream1.png");
 //onCone.draw();
 onCone= new Image2(catcher.x-40,catcher.y-35,40,40,"icecream2.png");
 onCone.draw();
  onCone= new Image2(catcher.x+40,catcher.y-35,40,40,"icecream3.png");
 onCone.draw();
  }
  
  
 if (score>=5)
 {
  onCone= new Image2(catcher.x,catcher.y-35,40,40,"icecream1.png");
 onCone.draw();
 onCone= new Image2(catcher.x-40,catcher.y-35,40,40,"icecream2.png");
 onCone.draw();
  onCone= new Image2(catcher.x+40,catcher.y-35,40,40,"icecream3.png");
 onCone.draw();
  onCone= new Image2(catcher.x+25,catcher.y-30,40,40,"icecream4.png");
 onCone.draw();
  onCone= new Image2(catcher.x-25,catcher.y-30,40,40,"icecream5.png");
 onCone.draw();
 }
 
 
 if (score>=8)
 {
   onCone=new Image2(catcher.x,catcher.y-55,40,40,"icecream3.png");
       onCone.draw();
    onCone= new Image2(catcher.x+25,catcher.y-55,40,40,"icecream2.png");
  onCone.draw();
  onCone=new Image2(catcher.x-25,catcher.y-55,40,40,"icecream4.png");
  onCone.draw();
     onCone= new Image2(catcher.x,catcher.y-35,40,40,"icecream1.png");
 onCone.draw();
 onCone= new Image2(catcher.x-40,catcher.y-35,40,40,"icecream2.png");
 onCone.draw();
  onCone= new Image2(catcher.x+40,catcher.y-35,40,40,"icecream3.png");
 onCone.draw();
  onCone= new Image2(catcher.x+25,catcher.y-30,40,40,"icecream4.png");
 onCone.draw();
  onCone= new Image2(catcher.x-25,catcher.y-30,40,40,"icecream5.png");
 onCone.draw();
   
 }
  
}
