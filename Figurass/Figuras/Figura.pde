class Figura 
{
  int id;
  boolean folow;
  PVector location;
  PVector velocity;
  color c = color(100,50);
  fig_intersect[] intersectt = new fig_intersect[3];  
  Figura(int id_temp) 
  {
    id = id_temp;
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    for(int i = 0;i < 3; i++) {intersectt[i] = new fig_intersect(0, 0.0);}
  }
 
  void update(Figura[] Figuras) 
  {
    for(int i = 0;i < Figuras.length; i++)
    {
      if (id != i)
      {
          if(this.intersect(Figuras[i]))
          {
             this.highlight(); 
             this.folow = true;
          }
          else {this.folow = false;}
      }
      
    }
    location.add(velocity);
    if ((this.location.x > width) || (this.location.x < 0)) {
    this.velocity.x = this.velocity.x * -1;
    }
    if ((this.location.y > height) || (this.location.y < 0)) {
      this.velocity.y = this.velocity.y * -1;
    }
  }
 
  void display() 
  {
    //noStroke(); 
    stroke(0);
    fill(c);
    ellipse(this.location.x,this.location.y,80,80);
    this.c = color(100,50);
  }
//  
  void highlight() 
  {
    this.c = color(74,8,118);
  }
//  
  boolean intersect(Figura Figuras) 
  {
    float distance = this.location.dist(Figuras.location); 
    if (distance < 80) 
    {  
      return true;
    } 
    else 
    {
      return false;
    }
  }
}
