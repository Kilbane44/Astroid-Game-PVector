float TIME = 1;
Astroid A;

ArrayList<Particle> PE = new ArrayList<Particle>();
ArrayList<Planet> Planets = new ArrayList<Planet>();
ArrayList<Dust> DE = new ArrayList<Dust>();
void setup()
{
  rectMode(CENTER);
  size(1200, 800);
  A = new Astroid();
}

void draw()
{
  background(0);

  A.Update();
  
  ManageParticles();
  ManageDust();
  ManagePlanets();
}


void ManageDust()
{
  for (int i=DE.size()-1; i >= 0; i--)
  {
    DE.get(i).Update();
    if(DE.get(i).CheckCollision(A))
    {
      DE.get(i).Drain(1);
      A.Grow(.1);
    }
    
    if (DE.get(i).kill)
    {
      DE.remove(i);
    }
  }
}

void ManagePlanets()
{
  for (int i=Planets.size()-1; i >= 0; i--)
  {
    Planets.get(i).Update();
    
    if(Planets.get(i).CheckCollision(A))
    {
      Planets.get(i).kill = true;
      A.Shrink(20);
    }
    
    if (Planets.get(i).kill)
    {
      Planets.remove(i);
    }
  }
}
void ManageParticles()
{
  PE.add(new Particle(mouseX+random(-30, 30), mouseY+random(-30, 30), A.position.x+random(-20, 20), A.position.y+random(-20, 20)));
  for (int i=PE.size()-1; i >= 0; i--)
  {
    PE.get(i).Update(); 

    if (PE.get(i).kill)
    {
      PE.remove(i);
    }
  }
}


void keyPressed()
{
  //spawn planet
  if (key == 'a')
  {
    Planets.add(new Planet());
  }
  if (key == 'd')
  {
    DE.add(new Dust());
  }

  //shooting star mode
  if (key == 's')
  {
    A.ChangeStarMode();
  }
}