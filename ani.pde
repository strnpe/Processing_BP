

import de.looksgood.ani.*;

float x = 256;
float y = 256;
int diameter = 50;

void setup() {
  size(512,512);
  smooth();
  noStroke();


  Ani.init(this);
}

void draw() {
  background(255);
  fill(0);
  ellipse(x,y,diameter,diameter);
}

void mouseReleased() {
  Ani.to(this, 1.0, "x", mouseX);
  Ani.to(this, 1.0, "y", mouseY);
}



