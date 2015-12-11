SpaceShip sardine = new SpaceShip();
ArrayList <Asteroid> astr = new ArrayList <Asteroid>();
ArrayList <Bullet> shot = new ArrayList <Bullet>();
int numShips = 3;

public void setup() 
{
  size(800, 600);
  sardine.setX(width/2);
  sardine.setY(height/2);
   for (int i = 0; i < 1; ++i) {
   shot.add(i, new Bullet(sardine));
  }
  for (int i = 0; i < 20; ++i) {
    astr.add(i, new Asteroid());
  }
  for (int i = 0; i < astr.size(); ++i) {
    astr.get(i).setX((int)(Math.random()*width)+0);
    astr.get(i).setY((int)(Math.random()*height)+0);
    astr.get(i).rotate((int)(Math.random()*360)+0);
    astr.get(i).accelerate(1);
  }
}

public void draw() 
{
  background(0);
  hud();
  sardine.show();
  sardine.move();
  for (int i = 0; i < shot.size(); ++i) {
   shot.get(i).show();
   shot.get(i).move();
  }
  for (int i = 0; i < astr.size(); ++i) {
    astr.get(i).show();
    astr.get(i).move();
    if(dist(astr.get(i).getX(), astr.get(i).getY(), sardine.getX(), sardine.getY()) < 20){
      sardine.setX(width/2);
      sardine.setY(height/2);
      sardine.setDirectionX(0);
      sardine.setDirectionY(0);
      numShips--;
    }
  }
  /*if(dist(x1, y1, x2, y2) < 20){
    astr.remove(0);
  }

  */
}

public void hud(){
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("Ships left: " + numShips, 0, 20);
  if (numShips <= 0) {
    textSize(50);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    noLoop();
  }
}

public void keyPressed()
{
  if(keyCode == UP){
    sardine.accelerate(.5);
  }
  if(keyCode == DOWN){
    sardine.setX((int)(Math.random()*width)+0);
    sardine.setY((int)(Math.random()*height)+0);
    sardine.setDirectionX(0);
    sardine.setDirectionY(0);
  }
  if(keyCode == LEFT){
    sardine.rotate(-5);
  }
  if(keyCode == RIGHT){
    sardine.rotate(5);
  }
  if(key == 'z'){
  for (int i = 0; i < shot.size(); ++i) {
   shot.get(i).accelerate(5);
  }
  }
  
}

class SpaceShip extends Floater //The Spaceship! 
{ 
  public SpaceShip()
  {
  corners = 4;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -8;
  yCorners[0] = -8;
  xCorners[1] = 16;
  yCorners[1] = 0;
  xCorners[2] = -8;
  yCorners[2] = 8;
  xCorners[3] = -2;
  yCorners[3] = 0;
  myColor = 255;
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}  
  public int getY(){return (int)myCenterY;}  
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return (int)myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return (int)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return (int)myPointDirection;} 
}

class Bullet extends Floater //Bullet
{
  public Bullet(SpaceShip sardine){
    corners = 2;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = 0;
    xCorners[1] = 2;
    yCorners[1] = 0;
    myCenterX = sardine.getX();
    myCenterY = sardine.getY();
    myPointDirection = sardine.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = sardine.getDirectionX();
    myDirectionY = sardine.getDirectionY();
    myColor = 255;
  }
  public void move()
  {
    super.move();
  }

  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}  
  public int getY(){return (int)myCenterY;}  
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return (int)myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return (int)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return (int)myPointDirection;} 
}


class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = 100;
    rotSpeed = 2;
  }
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}  
  public int getY(){return (int)myCenterY;}  
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return (int)myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return (int)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return (int)myPointDirection;} 
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

