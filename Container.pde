class Container {
  float radius;
  float skin;
  PVector position;
  
  int boidsHeld;
  
  Container(float radius, float skin, PVector position)
  {
    this.radius = radius;
    this.skin = skin;
    this.position = position;
  }
  
  void draw()
  {
    
    float multiplier = (float) boidsHeld / flock.boids.size();
    
    fill(255 * multiplier,0,0, 50);
    stroke(255,0,0,125);
    strokeWeight(skin * .5f);
    ellipse(position.x, position.y, radius, radius);
    
    boidsHeld = 0;
  }
}
