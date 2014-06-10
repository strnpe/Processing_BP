import processing.pdf.*;

void setup() {
  size(400, 400);
  beginRecord(PDF, "zaznam.pdf");
}

void draw() {

  line(mouseX, mouseY, width/2, height/2);
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
