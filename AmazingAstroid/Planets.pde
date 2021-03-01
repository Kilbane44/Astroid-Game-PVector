class Planet
{
  PVector position;
  PVector direction;
  PVector target;
  float speed = 10;
  float size=50;
  
  boolean kill = false;
  
  
  Planet()
  {
    speed = random(1,2);
    int ran = (int)random(0,4);
    position= new PVector(-1000,-1000);
    
    target = new PVector(random(width),random(height));
    if(ran == 0)
    {
      //left side random spawn
      position = new PVector(random(-400,-100),random(-100,height+100));
    }
    if(ran == 1)
    {
      position = new PVector(random(width+100,width+1000),random(-100,height+100));
    }
    if(ran == 2)
    {
      position = new PVector(random(-100, width+100),random(-1000,-100));
    }
    if(ran == 3)
    {
      position = new PVector(random(-100, width+100),random(height,height+100));
      println("posX: " + position.x);
      println("posY: " + position.y);
    }
    direction = new PVector(0,0);
    direction = target.copy().sub(position);
    direction.normalize();
    direction.mult(speed);
      println("ran: " + ran);
    
  }
  
  
  
  void Update()
  {
    ellipse(position.x, position.y, size, size);
    position.add(direction);
  }
  
  boolean CheckCollision(Astroid _A)
  {
    if(dist(_A.position.x, _A.position.y, position.x, position.y) < (_A.size+_A.power + size)/2)
    {
      return true;
    }
    return false;
  }
  
  
}