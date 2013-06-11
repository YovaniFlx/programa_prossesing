//Clase principal que contiene los atributos de la figura
abstract class Figura 
{
  float[] configuration;
  int id;  //identificador de cada figura
  float size_shape;  //tamaño de cada figura
  boolean follow;  //variable booleana para saber si puede seguir a otro
  PVector location;  //variable que tiene la posicion actual de la figura
  PVector velocity;  //variable de la velocidad de la figura
  //PVector acceleration;
  color c;
  float counter = 10;
  float topspeed;
  fig_distance[] distance = new fig_distance[1000];  //arreglo que guarda el id de la figura y la distancia cuando estan una sobre otra
  
  Figura(int id_temp, int tam, float[] config) //constructor inicial de las variables
  {
    configuration = config;
    id = id_temp;
    size_shape = config[1];
    c = color(100,50);
    follow = false;
    location = new PVector(random(width),random(height));
    topspeed = random(1,5);
    //velocity = new PVector(0,0);
    //acceleration = new PVector(-0.001,0.01);
    velocity = new PVector(random(-0.5,0.5),random(-0.5,0.5));
    for(int i = 0;i < distance.length; i++) {distance[i] = new fig_distance(-1, 0.0);}
  }
 
  void update(Figura[] Figuras)  //metodo de actualizacion de los valores de las figuras, recibe todos los valores del arreglo principal
  {
    start_distance();  //metodo para inicializar id y distancias en cada tiempo
    PVector newlocation = new PVector(0,0);
    PVector newvelocity = new PVector(0,0);
    int ind = 0;
    if((frameCount == 1) && (configuration[10] == 0)){
      move0();
    }
    else if((frameCount == 1) && (configuration[10] == 1)){
      move1();
    }
    else if((frameCount == 1) && (configuration[10] == 2)){
      move2();
    }
    
    for(int i = 0 ;i < Figuras.length; i++)  //ciclo para comparar la figura actual con todas las demas
    {
      if (this.id != i)  //condicion para no tomar encuenta la comparacion con la misma figura
      {
        if(this.intersect(Figuras[i]))  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
          {
            this.distance[ind].id = i; 
            this.distance[ind].distance = this.location.dist(Figuras[i].location);
            this.follow = true;
            line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
            if(configuration[6] == 1.0){
              this.highlight();
            } 
            
            if(configuration[7] == 1.0){          
              if((this.id < Figuras[i].id))
              {
                newlocation.add(this.location); newlocation.sub(Figuras[i].location);
                newlocation.mult(0.015);
                this.location.sub(newlocation);
                newvelocity.set(Figuras[i].velocity);
                newvelocity.mult(0.10);              
              }
            }
            ind ++;   
         }
         else {this.follow = false;}  //pone en falso la variable que follow       
      } 
    }
    if(configuration[8] == 0.0){
      Constrain_to_surface();
    }
    else if(configuration[8] == 1.0){
      if(configuration[10] == 0.0){
        
        if(this.location.x > width){
          this.location.x  = width/2;
          this.location.y  = height/2;
        }
        if(this.location.x < 0){
          this.location.x  = width/2;
          this.location.y  = height/2;
        }
        if(this.location.y > height){
          this.location.y  = height/2;
          this.location.x  = width/2;
        }
        if(this.location.y < 0){
          this.location.y  = height/2;
          this.location.x  = width/2;
        }
      }
      else {
        Constrain_to_surface2();
      } 
    }  
   
    //velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);  //agrega velocidad a la localizacion actual
    
  }
  //Selimita la simulacion a un espacio
  void Constrain_to_surface()
  {
    if ((this.location.x > width) || (this.location.x < 0)) {  
    this.velocity.x = this.velocity.x * -1;
    }
    if ((this.location.y > height) || (this.location.y < 0)) {
      this.velocity.y = this.velocity.y * -1;
    }
  }
  
  void Constrain_to_surface2()
  {
    if(this.location.x > width){
      this.location.x  = 0;
    }
    if(this.location.x < 0){
      this.location.x  = width;
    }
    if(this.location.y > height){
      this.location.y  = 0;
    }
    if(this.location.y < 0){
      this.location.y  = height;
    }
  } 
 //metodo que cambia de color las figuras para denotar que estan sobrepuestas
  void highlight() 
  {
      this.c = color(0,150);    
  }
  //metodo que identifica si hay sobreposicion
  boolean intersect(Figura Figuras) 
  {
    float distance = this.location.dist(Figuras.location); 
    if (distance < ((this.size_shape/2)+(Figuras.size_shape/2))) 
    {  
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
  void move0()
  {
    this.location.x = (width / 2);
    this.location.y = (height / 2);  
  }
  
  void move1()
  {
    this.location.y = (height / 2);
    this.location.x = random (1,width);  
  }
  void move2()
  {
    this.location.x = (width / 2);
    this.location.y = random (1,height);  
  }
  
   //metodo que inicializa el arreglo de id y distancias
  void start_distance() 
  {
    for(int i = 0;i < distance.length; i++)
    {this.distance[i].id = -1; this.distance[i].distance = 0.0;}
  }
  abstract void display();
  //abstract void rotate_();
}

//Clase circulo que hereda las propiedades de la clase figura
class Circulo extends Figura
{
  Circulo(int id_temp, int tam, float[] config)
  {
    super(id_temp, tam, config);
  }
  void update(Circulo[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display() //metodo que dibuja las figuras
  {
    int tot = (int)configuration[0];
    int index;
    stroke(c);
    ellipseMode(CENTER);
    //ellipse(this.location.x,this.location.y,this.size_shape,this.size_shape);
    this.c = color(100,50);
    
//    if(this.follow){
//      for(int i=0;i<tot;i++){
//        if(distance[i].id != -1){
//          index = (int)distance[i].id;
//          line(this.location.x,this.location.y,Figuras[index].location.x,Figuras[index].location.y);
//        }
//      }
//    }
  }
}

class Cuadro extends Figura
{
  Cuadro(int id_temp, int tam, float[] config)
  {
    super(id_temp, tam, config);
  }
  void update(Cuadro[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display() //metodo que dibuja las figuras
  {
    //fill(c);
    //noStroke(); 
    rectMode(CENTER);
    stroke(c);
    if((configuration[9] == 1.0)){
      pushMatrix();
      translate(this.location.x, this.location.y);
      rotate(counter*TWO_PI/360);
      rect(0,0,this.size_shape,this.size_shape);
      popMatrix();
      counter = counter + 5;
    }
    else{
      rect(this.location.x,this.location.y,this.size_shape,this.size_shape);
    }
    this.c = color(100,50);
    
  }
}
class Triangule extends Figura
{
  float radio = 0;
  float theta = 120;
  PVector a = new PVector(0,0);
  PVector b = new PVector(0,0);
  PVector C = new PVector(0,0);
  
  Triangule(int id_temp, int tam, float[] config)
  {
    super(id_temp, tam, config);  
  }
  void update(Triangule[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display() //metodo que dibuja las figuras
  {
    //fill(c);
    stroke(c);
    radio = (size_shape * 2.3)/4;
    a.x = location.x;
    a.y = location.y - radio;
    b.x = (location.x - (radio * cos(theta)));
    b.y = (location.y + (radio * sin(theta)));
    C.x = (location.x + (radio * cos(theta)));
    C.y = (location.y + (radio * sin(theta)));
    if((configuration[9] == 1.0)){
      pushMatrix();
        translate(this.location.x,this.location.y);
        rotate(counter*TWO_PI/360);
        translate(this.location.x * (-1),this.location.y * (-1));
        triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
      popMatrix();
      counter = counter + 5;
    }
    //point(this.location.x,this.location.y);
    this.c = color(100,50);
  }
}

