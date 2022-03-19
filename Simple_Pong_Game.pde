float x, y, speedX, speedY;
float diam = 10;
float rectSize = 200;
int score = 0;

void setup() {
  size(1900, 1000);
  fill(0, 255, 0);
  reset();
}
void reset() {
  x = width/2;
  y = height/2;
  speedX = random(3, 5);
  speedY = random(3, 5);
}
void draw() {
  background(0);
  
  text("Score: " + score, 100, 50);
  textSize(30);
  
  ellipse(x, y, diam, diam);

  rect(0, 0, 20, height);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);

  x+= speedX;
  y+= speedY;

  if (x > width-30 && x < width-20 && y > mouseY-rectSize/2 && y< mouseY+rectSize/2) {
    speedX *= -1;
    score++;
  }
  println(mouseY-rectSize/2);

  if (x < 25) { 
    speedX *= -1.1;
    speedY *= 1.1;
    x += speedX;
  }
  if (y > height || y < 0) {
    speedY *= -1;
  }
  
  if(x > width) {
    text("GAME OVER", width/2, height/2);
    text("SCORE: " + score, width/2, height/2 + 50);
    text("Click to Reset", width/2, height/2 + 100);
  }
}
void mousePressed() {
  score = 0;
  reset();
}
