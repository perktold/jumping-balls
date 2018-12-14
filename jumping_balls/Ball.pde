class Ball{
  float x, y;
  float xSpeed, ySpeed;
  int rad;
  boolean radGrows;
  boolean grabbed;
  Ball(){
    this.x = (int) random(0, width);
    this.y = (int) random(0, height);
    this.xSpeed = random(-5, 5);
    this.ySpeed = random(-10, 10);
    this.rad = (int) random(80, 130);
    this.radGrows = true;
    this.grabbed = false;
  }
  void move(){
    this.x += xSpeed;
    this.y += ySpeed;
    this.xSpeed += wind;
    this.ySpeed += gravity;
    bounce();
    //changeRad();
    getPickedUp();
  }
  void getPickedUp(){
    if(mousePressed && ((mouseX > this.x - this.rad) && (mouseX < this.x + this.rad)) && ((mouseY > this.y - this.rad) && (mouseY < this.y + this.rad))){
      this.grabbed = true;
    }
    if(!mousePressed){
      this.grabbed = false;
    }
    if(grabbed){
      this.xSpeed = (mouseX - x) * 0.15;
      this.ySpeed = (mouseY - y) * 0.15;
    }
  }
  void changeRad(){
    if(this.rad < 5 || this.rad > 50){
      this.radGrows = !this.radGrows;
    }
    if(this.radGrows){
      this.rad++;
    }else if(!this.radGrows){
      this.rad--;
    }
  }
  void bounce(){
      if(this.x <= this.rad / 2 && xSpeed < 0){
        this.xSpeed *= -0.8;
      }
      if(this.x > width - this.rad / 2 && xSpeed > 0){
        this.xSpeed *= -0.8;
      }
      if(this.y >= height - this.rad / 2 && ySpeed > 0){
        this.ySpeed *= -0.8;
        if(this.ySpeed < 3.2 && this.ySpeed > -3.2){
          this.ySpeed = 0;
          this.y = height - this.rad / 2;
        }
        this.xSpeed *= 0.99;
      }
      if(this.y <= 0 && ySpeed < 0){
        this.ySpeed *= -0.8;
      }
  }
  void show(){
    fill(255);
    ellipse(this.x, this.y, this.rad, this.rad);
  }
}
