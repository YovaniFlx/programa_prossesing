//Clase principal que contiene los atributos de la figura
abstract class Figura 
{
   float[] configuration;
   int id;  //identificador de cada figura
   float size_shape;  //tamaño de cada figura
   boolean follow;  //variable booleana para saber si puede seguir a otro
   PVector location;  //variable que tiene la posicion actual de la figura
   PVector velocity;  //variable de la velocidad de la figura
   color[] colors = new color[10];
   //PVector acceleration;
   int c, contframe = 0;
   float counter = 10;
   float topspeed;
   fig_distance[] distance = new fig_distance[1000];  //arreglo que guarda el id de la figura y la distancia cuando estan una sobre otra
  
  Figura(int id_temp, int tam, float[] config) //constructor inicial de las variables
  {
    configuration = config;
    id = id_temp;
    size_shape = config[1];
    //c = color(100,50);
    follow = false;
    location = new PVector(random(width),random(height));
    topspeed = random(1,5);
    //velocity = new PVector(0,0);
    //acceleration = new PVector(-0.001,0.01);
    velocity = new PVector(random(-2,2),random(-2,2));
    for(int i = 0;i < distance.length; i++) {distance[i] = new fig_distance(-1, 0.0, 0);}
 
//     colors[0] = color(#007F6A); 
//     colors[1] = color(#007F6A); 
//     colors[2] = color(#4CFFE1); 
//     colors[3] = color(#4CFFE1); 
//     colors[4] = color(#00FFD5);  
//     colors[5] = color(#00FFD5);  
//     colors[6] = color(#767F7E);  
//     colors[7] = color(#767F7E);  
//     colors[8] = color(#00CCAA); 
//     colors[9] = color(#00CCAA);

      colors[0] = color(#B29253);
      colors[1] = color(#B29253);
      colors[2] = color(#07FF7F);
      colors[3] = color(#07FF7F);
      colors[4] = color(#FFAD10);
      colors[5] = color(#FFAD10);
      colors[6] = color(#A661CC);
      colors[7] = color(#A661CC);
      colors[8] = color(#7402B2);
      colors[9] = color(#7402B2);
  }
 
  void update(Figura[] Figuras)  //metodo de actualizacion de los valores de las figuras, recibe todos los valores del arreglo principal
  {
    float dis = 0;
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
             this.follow = true;
             this.distance[ind].id = i; 
             this.distance[ind].distance = this.location.dist(Figuras[i].location);
             dis = this.location.dist(Figuras[i].location);
             this.distance[ind].color_ = buscar_color(dis,size_shape);
             c = this.distance[ind].color_;
//             if(this.c >= 9){
//               this.c = 9;
//             }
//             else {
//               this.c ++;
//             }
             stroke(colors[c]);
             //line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
             if(configuration[6] == 1.0){
               //this.highlight();
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
          else {
            this.follow = false;
            if(this.c >= 9){
              this.c = 0;
            } 
          }  //pone en falso la variable que follow       
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
      else if(configuration[8] == 1.0){
        if(configuration[10] == 1.0){
          if(this.location.x > width){
            this.location.y = (height / 2);
            this.location.x = random (1,width);
          }
          if(this.location.x < 0){
            this.location.y = (height / 2);
            this.location.x = random (1,width);
          }
          if(this.location.y > height){
            this.location.y = (height / 2);
            this.location.x = random (1,width);
          }
          if(this.location.y < 0){
            this.location.y = (height / 2);
            this.location.x = random (1,width);
          }
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
  int highlight(int c_frame) 
  {
    if((c_frame >= 0) &&(c_frame <=10)){
      return  0;
    }
    else if((c_frame >= 11) &&(c_frame <=20)){
      return  2;
    }
    else if((c_frame >= 21) &&(c_frame <=30)){
      return  4;
    }
    else if((c_frame >= 31) &&(c_frame <=40)){
      return  6;
    }
    else{
      return  8;
    }
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
    velocity = new PVector(random(-2,2),random(-2,2));
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
  
  int buscar_color(float dis, float size)
  {
    
    int col = 0;
    float porcentaje = 0;
    porcentaje = ((dis * 100) / (size));
    //println(dis +","+ size+" , "+ porcentaje);
    if((porcentaje <= 100) && (porcentaje >= 91)){
      return  9;
    }
    else if((porcentaje <= 90) && (porcentaje >= 81)){
      return  8;
    }
    else if((porcentaje <= 80) && (porcentaje >= 71)){
      return  7;
    }
    else if((porcentaje <= 70) && (porcentaje >= 61)){
      return  6;
    }
    else if((porcentaje <= 60) && (porcentaje >= 51)){
      return  5;
    }
    else if((porcentaje <= 50) && (porcentaje >= 041)){
      return  4;
    }
    else if((porcentaje <= 40) && (porcentaje >= 31)){
      return  3;
    }
    else if((porcentaje <= 30) && (porcentaje >= 21)){
      return  2;
    }
    else if((porcentaje <= 20) && (porcentaje >= 11)){
      return  1;
    }
    else{
      return  0;
    }
  }
  
  abstract void display(Figura[] Figuras);

}

//Clase circulo que hereda las propiedades de la clase figura
class Circulo extends Figura
{
  Circulo(int id_temp, int tam, float[] config)
  {
    super(id_temp, tam, config);
  }
  void update(Figura[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display(Figura[] Figuras) //metodo que dibuja las figuras
  {
    for(int i = 0 ;i < Figuras.length; i++)  //ciclo para comparar la figura actual con todas las demas
    {
      if (this.id != i)  //condicion para no tomar encuenta la comparacion con la misma figura
      {
        if(this.intersect(Figuras[i]))  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
        {
          stroke(c);
          ellipseMode(CENTER);
          ellipse(this.location.x,this.location.y,this.size_shape,this.size_shape);
          this.c = color(100,50);
        }
      }
    }  
  }
}

class Cuadro extends Figura
{
  Cuadro(int id_temp, int tam, float[] config)
  {
    super(id_temp, tam, config);
  }
  void update(Figura[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display(Figura[] Figuras) //metodo que dibuja las figuras
  {   
    for(int i = 0 ;i < Figuras.length; i++)  //ciclo para comparar la figura actual con todas las demas
    {
      if (this.id != i)  //condicion para no tomar encuenta la comparacion con la misma figura
      {
        if(this.intersect(Figuras[i]))  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
        {
          stroke(colors[c]);                      
          rectMode(CENTER);
          //line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
          if(configuration[9] == 1.0){
            pushMatrix();
              translate(this.location.x, this.location.y);
              rotate(counter*TWO_PI/360);
              stroke(colors[c]);
              //fill(255);
              rect(0,0,this.size_shape,this.size_shape);
              //line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
            popMatrix();
            counter++; 
            println(c);
          }
          else{
//            counter++;
            //fill(255);
            rect(this.location.x,this.location.y,this.size_shape,this.size_shape);
            //line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
          }
        }
      }
    }
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
  void update(Figura[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display(Figura[] Figuras) //metodo que dibuja las figuras
  {
    for(int i = 0 ;i < Figuras.length; i++)  //ciclo para comparar la figura actual con todas las demas
    {
      if (this.id != i)  //condicion para no tomar encuenta la comparacion con la misma figura
      {
        if(this.intersect(Figuras[i]))  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
        {
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
              stroke(colors[c]);
              triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
            popMatrix();
            counter = counter + 1;
          }
          else{
            //fill(255);
            triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
          }
        }
      }
    }
  }
}  

