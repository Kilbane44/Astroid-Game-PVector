class Dust
{
   PVector position;
   float amount = 100;
   boolean kill = false;
   
   Dust()
   {
     position = new PVector(width+ 300, random(100,height-100));
   }
   
   
   void Update()
   {
     fill(255,0,255);
     rect(position.x, position.y, amount,amount);
     
     position.x -= 1;
     
     if(amount <= 0)
     {
       kill = true;
     }
   }
  
  
  
  boolean CheckCollision(Astroid _A)
  {
    if(dist(_A.position.x, _A.position.y, position.x, position.y) < (_A.size+_A.power + amount)/2)
    {
      return true;
    }
    return false;
  }
  
  
  void Drain(float amt)
  {
    amount -= amt;
  }
}