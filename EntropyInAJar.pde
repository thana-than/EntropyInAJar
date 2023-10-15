/**
 * ENTROPY IN A JAR - By Than
 * Built off of Processing example Flocking by Daniel Shiffman.
 */

Flock flock;
Selection selection;

ArrayList<Container> containers;

void setup() {
  size(500, 500);
  flock = new Flock();
  selection = new Selection(100);
  containers = new ArrayList<Container>();
  containers.add(new Container(150,10,new PVector(width / 2, height / 2)));
  
  // Add an initial set of boids into the system
  for (int i = 0; i < 500; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}

void draw() {
  background(50);
  flock.run();
  
  selection.draw();
  
  for(int i = containers.size() - 1; i >= 0; i--)
  {
    containers.get(i).draw();
  }
}

// Add a new boid into the System
void mousePressed() {
  selection.Activate(new PVector(mouseX, mouseY));
}

void mouseReleased()
{
  selection.Deactivate();
}

void mouseDragged()
{
  selection.move(new PVector(mouseX, mouseY));
}
