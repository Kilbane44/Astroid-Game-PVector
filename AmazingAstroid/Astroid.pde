class Astroid
{
  PVector position;
  PVector acceleration;
  PVector velocity;
  float topspeed;
  
  float size = 50;
  
  float power = 0;
  boolean shootingStarMode = false;
  
  Astroid()
  {
    position = new PVector(width/2, height/2);
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    topspeed = 5;
  }
  
  
  void Update()
  {
    PVector Mouse;
    PVector dir;
    Mouse = new PVector(mouseX, mouseY);
    PVector offScreen = new PVector(-1000, height/2);
    if (mousePressed)
    {
      dir = PVector.sub(position, Mouse);
    } else
    {   
      dir= PVector.sub(offScreen, position);
    }
    
    dir.normalize();
    //dir.mult(3.5);

    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);

    position.add(velocity);

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }


    fill(111);
    
    if(shootingStarMode)
    {
      fill(255,255,0);
    }
    ellipse(position.x, position.y, size+power, size+power);
  }
  
  public void ChangeStarMode()
  {
    shootingStarMode = !shootingStarMode;
  }
  
  void Grow(float amt)
  {
    power += amt;
  }
  void Shrink(float amt)
  {
    power -= amt;
  }
  
  
}