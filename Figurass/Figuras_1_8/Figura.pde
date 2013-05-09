//Clase principal que contiene los atributos de la figura
abstract class Figura 
{
  int id;  //identificador de cada figura
  float size_shape;  //tamaño de cada figura
  boolean follow;  //variable booleana para saber si puede seguir a otro
  PVector location;  //variable que tiene la posicion actual de la figura
  PVector velocity;  //variable de la velocidad de la figura
  color c;
  fig_distance[] distance = new fig_distance[1000];  //arreglo que guarda el id de la figura y la distancia cuando estan una sobre otra
  
  Figura(int id_temp) //constructor inicial de las variables
  {
    id = id_temp;
    size_shape = random(10,30);
    c = color(1,1,1);
    follow = false;
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-0.5,0.5),random(-0.5,0.5));
    for(int i = 0;i < distance.length; i++) {distance[i] = new fig_distance(-1, 0.0);}
  }
 
  void update(Figura[] Figuras)  //metodo de actualizacion de los valores de las figuras, recibe todos los valores del arreglo principal
  {
    PVector newlocation = new PVector(0,0);
    PVector newvelocity = new PVector(0,0);
    int ind = 0;
    for(int i = 0 ;i < Figuras.length; i++)  //ciclo para comparar la figura actual con todas las demas
    {
      if (this.id != i)  //condicion para no tomar encuenta la comparacion con la misma figura
      {
          if(this.intersect(Figuras[i]))  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
          {
            this.distance[ind].id = i; 
            this.distance[ind].distance = this.location.dist(Figuras[i].location);
            this.highlight(); 
            this.follow = true;
            
            if(this.id < Figuras[i].id)
            {
              
              newlocation.add(this.location); newlocation.sub(Figuras[i].location);
              newlocation.mult(0.015);
              this.location.sub(newlocation);
              newvelocity.set(Figuras[i].velocity);
              newvelocity.mult(0.10);              
            }
            ind ++;   
          }
          else {this.follow = false;}  //pone en falso la variable que follow 
      }
    }
    //aqui va quien es al que va a seguir
    if ((this.location.x > width) || (this.location.x < 0)) {  //Delimita la simulacion
    this.velocity.x = this.velocity.x * -1;
    }
    if ((this.location.y > height) || (this.location.y < 0)) {
      this.velocity.y = this.velocity.y * -1;
    }
    location.add(velocity);  //agrega velocidad a la localizacion actual
    start_distance();  //metodo para inicializar id y distancias en cada tiempo
  }
 
  void highlight() //metodo que cambia de color las figuras para denotar que estan sobrepuestas
  {
    //this.c = color(100,200);
    //textSize(32);
    //text(this.id, this.location.x, this.location.y);
    //fill(12,60);
    if (this.follow)
    {
      if (frameCount % 3 == 0) 
      {
        this.c = color(frameCount * 3 % 255, frameCount * 5 % 255, frameCount * 7 % 255);
      }
    }
//    if(this.follow)
//    {
//      fill(c);
//    }
//    else{noFill();}
  }
  
  boolean intersect(Figura Figuras) //metodo que identifica si hay sobreposicion
  {
    float distance = this.location.dist(Figuras.location); 
    if (distance < this.size_shape) 
    {  
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
  void start_distance()  //metodo que inicializa el arreglo de id y distancias
  {
    for(int i = 0;i < distance.length; i++)
    {this.distance[i].id = -1; this.distance[i].distance = 0.0;}
  }
  abstract void display();
}

//Clase circulo que hereda las propiedades de la clase figura
class Circulo extends Figura
{
  Circulo(int id_temp)
  {
    super(id_temp);
  }
  void update(Circulo[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display() //metodo que dibuja las figuras
  {
    noStroke(); 
    stroke(c);
    ellipseMode(CENTER);
    //stroke(0);
//    if(this.follow)
//    {
//      fill(c);
//    }
//    else{noFill();}
    ellipse(this.location.x,this.location.y,this.size_shape,this.size_shape);
    //textSize(32);
    //text(this.id, this.location.x, this.location.y);
    //fill(255);
    //this.c = color(100,50);
  }
}

class Cuadro extends Figura
{
  Cuadro(int id_temp)
  {
    super(id_temp);
  }
  void update(Cuadro[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display() //metodo que dibuja las figuras
  {
    noStroke(); 
    rectMode(CENTER);
    //stroke(0);
    stroke(c);
    rect(this.location.x,this.location.y,this.size_shape,this.size_shape);
    //textSize(32);
    //text(this.id, this.location.x, this.location.y);
    //fill(255);
    //this.c = color(100,50);
  }
}
