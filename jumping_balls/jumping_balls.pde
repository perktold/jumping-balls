Ball[] balls = new Ball[30];
float gravity = 0.8;
float wind = 0;

void setup(){
  fullScreen(); 
  //size(500, 500);
  noStroke();
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}
void draw(){
  background(0);
  for(int i = 0; i < balls.length; i++){
    balls[i].move();
    balls[i].show();
  }
}
