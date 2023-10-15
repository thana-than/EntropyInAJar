class Selection
{
  float radius;
  PVector position = new PVector(0,0);
  boolean active = false;
  
  ArrayList<Boid> heldBoids;
  
  
  Selection(float radius)
  {
    this.radius = radius;
    heldBoids = new ArrayList<Boid>();
  }
  
  void Activate(PVector position)
  {
    active = true;
    
    this.position = position;
    
    regenHeldBoids();
  }
  
  void clearHeldBoids()
  {
    int heldLen = heldBoids.size();
    for(int i = 0; i < heldLen; i++)
    {
      Boid b = heldBoids.get(i);
      b.selectionMultiplier = 1;
    }
    
    heldBoids.clear();
  }
  
  void regenHeldBoids()
  {
    clearHeldBoids();
    
    int len = flock.boids.size();
    for(int i = 0; i < len; i++)
    {
      Boid b = flock.boids.get(i);
      float dist = PVector.dist(position, b.position) - b.r;
      if (dist <= radius * .5f)
      {
        heldBoids.add(b);
        b.selectionMultiplier = 0;
      }

     
    }
  }
  
  void Deactivate()
  {
    active = false;
    clearHeldBoids();
  }
  
  void draw()
  {
    if (!active)
      return;
      
    fill(0,125,255, 50);
    stroke(0,125,255,255);
    strokeWeight(1);
    ellipse(position.x, position.y, radius, radius);
  }
  
  void move(PVector position)
  {
    if (!active)
      return;
      
      PVector translation = position.copy();
      translation.sub(this.position);
      
      
      
      int len = heldBoids.size();
      for(int i = 0; i < len; i++)
      {
        Boid b = heldBoids.get(i);
        b.position.add(translation);
      }
        
     this.position = position;
  }
}
