class Figura 
{
  int id;  //identificador de cada figura
  int size_shape;  //tamaño de cada figura
  boolean folow;  //variable booleana para saber si puede seguir a otro
  PVector location;  //variable que tiene la posicion actual de la figura
  PVector velocity;  //variable de la velocidad de la figura
  color c;
  fig_intersect[] intersectt = new fig_intersect[9];  //arreglo que guarda el id de la figura y la distancia cuando estan una sobre otra
  
  Figura(int id_temp) //constructor inicial de las variables
  {
    id = id_temp;
    size_shape = 80;
    c = color(100,50);
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    for(int i = 0;i < intersectt.length; i++) {intersectt[i] = new fig_intersect(0, 0.0);}
  }
 
  void update(Figura[] Figuras)  //metodo de actualizacion de los valores de las figuras, recibe todos los valores del arreglo principal
  {
    int ind = 0;
    for(int i = 0 ;i < Figuras.length; i++)  //ciclo para comparar la figura actual con todas las demas
    {
      if (this.id != i)  //condicion para no tomar encuenta la comparacion con la misma figura
      {
          if(this.intersect(Figuras[i]))  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
          {
            this.intersectt[ind].id = i; 
            this.intersectt[ind].distance = this.location.dist(Figuras[i].location);
            this.highlight(); 
            this.folow = true;
            ind ++;
            println(this.id + " " + this.intersectt[0].id + " " + this.intersectt[0].distance);  //imprime datos para analizar resultados
            println(this.id + " " + this.intersectt[1].id + " " + this.intersectt[1].distance);  //imprime datos para analizar resultados  
            println(this.id + " " + this.intersectt[2].id + " " + this.intersectt[2].distance);  //imprime datos para analizar resultados
            println("---");
            noLoop();  // pausa el sistema para hacerlo paso a paso, para reanudar hay que dar un clic en la simulacion
            
          }
          else {this.folow = false;}  //pone en falso la variable que follow
      }
    }
    location.add(velocity);  //agrega velocidad a la localizacion actual
    
    if ((this.location.x > width) || (this.location.x < 0)) {  //Delimita la simulacion
    this.velocity.x = this.velocity.x * -1;
    }
    if ((this.location.y > height) || (this.location.y < 0)) {
      this.velocity.y = this.velocity.y * -1;
    }
    
    start_intersect();  //metodo para inicializar id y distancias en cada tiempo

  }
 
  void display() //metodo que dibuja las figuras
  {
    //noStroke(); 
    ellipseMode(CENTER);
    stroke(0);
    fill(c);
    ellipse(this.location.x,this.location.y,this.size_shape,this.size_shape);
    textSize(32);
    text(this.id, this.location.x, this.location.y);
    fill(255);
    this.c = color(100,50);
  }
//  
  void highlight() //metodo que cambia de color las figuras para denotar que estan sobrepuestas
  {
    this.c = color(100,200);
    textSize(32);
    text(this.id, this.location.x, this.location.y);
    fill(12,60);
  }
//  
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
  void start_intersect()  //metodo que inicializa el arreglo de id y distancias
  {
    for(int i = 0;i < intersectt.length; i++)
    {this.intersectt[i].id = 0; this.intersectt[i].distance = 0.0;}
  }
}
