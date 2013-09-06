//Clase principal que contiene los atributos de la figura
abstract class Figura 
{
   float[] configuration;
   int id;  //identificador de cada figura
   float size_shape;  //tamaño de cada figura
   boolean follow, bandera;  //variable booleana para saber si puede seguir a otro
   PVector location;  //variable que tiene la posicion actual de la figura
   PVector velocity;  //variable de la velocidad de la figura
   color[] colors = new color[10]; // variable de color
   int c, contframe = 0; //variable de color
   float counter = 0; //variable auxiliar de contador
   float topspeed;
   fig_distance[] distance = new fig_distance[1000];  //arreglo que guarda el id de la figura y la distancia cuando estan una sobre otra
  
  Figura(int id_temp, int tam, float[] config) //constructor inicial de las variables
  {
    configuration = config;
    id = id_temp;
    size_shape = config[1];
    follow = false;
    location = new PVector(random(width),random(height));
    topspeed = random(1,5);
    //velocity = new PVector(0,0);
    //acceleration = new PVector(-0.001,0.01);
    velocity = new PVector(random(-1,1),random(-1,1));
    for(int i = 0;i < distance.length; i++) {distance[i] = new fig_distance(-1, 0.0, 0);}
//------------------------------una paleta de colores-------------------------------------------
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
            if(configuration[6] == 1.0){
              c = this.distance[ind].color_;
            } 
            if(configuration[7] == 1.0){          
              if((this.id < Figuras[i].id))
              {
//              newlocation.add(this.location); newlocation.sub(Figuras[i].location);
//              newlocation.mult(0.015);
//              this.location.sub(newlocation);
//              newvelocity.set(Figuras[i].velocity);
//              newvelocity.mult(0.10);  
             //------------------calcula la aproximacion de las figuras---------------------------------
                newlocation.add(this.velocity); newlocation.sub(Figuras[i].velocity);  
                newlocation.mult(0.015);  
                this.velocity.sub(newlocation);        
              }
            }
            ind ++;   
          }
          else {
            this.follow = false;
          }  //pone en falso la variable que follow       
        } 
      }    //-----------------------evaluacion de los movimientos-----------------------------------------------------
      if(configuration[8] == 0.0){
        Constrain_to_surface();
      }
      else if(configuration[8] == 1.0){
        if(configuration[10] == 0.0){
          if(this.location.x > width){
            this.location.x  = width/2;
            this.location.y  = height/2;
            velocity = new PVector(random(-1,1),random(-1,1)); 
            
          }
          if(this.location.x < 0){
            this.location.x  = width/2;
            this.location.y  = height/2;
            velocity = new PVector(random(-1,1),random(-1,1));
          }
          if(this.location.y > height){
            this.location.y  = height/2;
            this.location.x  = width/2;
            velocity = new PVector(random(-1,1),random(-1,1));
          }
          if(this.location.y < 0){
           this.location.y  = height/2;
           this.location.x  = width/2;
           velocity = new PVector(random(-1,1),random(-1,1));
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
       else if(configuration[8] == 1.0){
         if(configuration[10] == 2.0){
           if(this.location.x > width){
             this.location.x = (width / 2);
             this.location.y = random (1,height);
           }
           if(this.location.x < 0){
             this.location.x = (width / 2);
             this.location.y = random (1,height);
           }
           if(this.location.y > height){
             this.location.x = (width / 2);
             this.location.y = random (1,height);
           }
           if(this.location.y < 0){
             this.location.x = (width / 2);
             this.location.y = random (1,height);
           }
         } 
       else if(configuration[8] == 1.0){
         if(configuration[10] == 3.0){
           if(this.location.x > width){
             this.location.x = this.location.x - this.location.x;            
           }
           if(this.location.x < 0){
             this.location.x = width;
           }
           if(this.location.y > height){
             this.location.y = 0;
           }
           if(this.location.y < 0){
             this.location.y = height;
           }
         } 
       }
     }  
   }
 } 
 velocity.limit(topspeed);
 location.add(velocity);  //agrega velocidad a la localizacion actual 
}
  //Se limita la simulacion a un espacio
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
      this.location.y  = 0;
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
 //metodo que cambia de color las figuras 
  void highlight() 
  {
    if(configuration[6] == 0){
      if(configuration[11] == 0){
        stroke(colors[c]);
      }
      if(configuration[11] == 1.0){
        fill(colors[c + 1]);
        stroke(colors[c + 1]);
      }
    }
    if(configuration[6] == 1.0){
      if(configuration[11] == 0){
        stroke(colors[c]);
      }
      if(configuration[11] == 1.0){
        fill(colors[c]);
        noStroke();
      }
    }
    if(configuration[6] == 2.0){
      c--;
      if(configuration[11] == 0){
        stroke(c);
      }
      if(configuration[11] == 1.0){
        fill(c - 80);
        noStroke();
      }
    }
    if(configuration[6] == 3.0){
      c = (c + 1) % 256;
      if(configuration[11] == 0){
        stroke(c,255,c,100);
      }
      if(configuration[11] == 1.0){
        fill(c,255,255,100);
        noStroke();
      }
    }
    if(configuration[6] == 4.0){
      c = (c + 1) % 256;
      if(configuration[11] == 0){
        stroke(c,20);
      }
      if(configuration[11] == 1.0){
        fill(c,100);
        stroke(c,100);
      }
    }
  }
  //------------------metodo que identifica si hay sobreposicion---------------
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
  //-------------------funcion de movimientos iniciales-----------------------------
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
  //-------------------funcion de rotacion---------------------------------------
  void rotate2D(PVector v, float theta) {
    float m = v.mag();
    float a = v.heading2D();
    a += theta;
    v.x = m * cos(a);
    v.y = m * sin(a);
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
    if(configuration[4] == 1.0){
      if(configuration[5] == 1.0){
        for(int i = 0 ;i < Figuras.length; i++){  //ciclo para comparar la figura actual con todas las demas
          if (this.id != i){  //condicion para no tomar encuenta la comparacion con la misma figura
            if(this.intersect(Figuras[i])){  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
              highlight();
              ellipse(this.location.x,this.location.y,size_shape,size_shape);
            }
          }
        }
      }
      else{
          highlight();
          ellipse(this.location.x,this.location.y,size_shape,size_shape);
      }
    }   
  }
}

class Cuadro extends Figura
{
  Cuadro(int id_temp, int tam, float[] config){
    super(id_temp, tam, config);
  }
  void update(Figura[] Figuras){
    super.update(Figuras);
  }
  
  void display(Figura[] Figuras) //metodo que dibuja las figuras
  {   
    if(configuration[5] == 1.0){
      for(int i = 0 ;i < Figuras.length; i++){  //ciclo para comparar la figura actual con todas las demas
        if (this.id != i){  //condicion para no tomar encuenta la comparacion con la misma figura
          if(this.intersect(Figuras[i])){  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
            highlight();                      
            rectMode(CENTER);
            if(configuration[9] == 1.0){
              pushMatrix();
                translate(this.location.x, this.location.y);
                rotate(counter*TWO_PI/360);
                rect(0,0,this.size_shape,this.size_shape);
                line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
              popMatrix();
              counter++; 
            }
            else{
              line(this.location.x,this.location.y,Figuras[i].location.x,Figuras[i].location.y);
            }
          }
        }
      }
    }
    if(configuration[5] == 0){                  
            rectMode(CENTER);
            if(configuration[9] == 1.0){
              pushMatrix();
                translate(this.location.x, this.location.y);
                rotate(counter*TWO_PI/360);
                highlight();
                rect(0,0,this.size_shape,this.size_shape);
              popMatrix();
              counter++;; 
            }
            else{
              rect(this.location.x,this.location.y,this.size_shape,this.size_shape);
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
    if(configuration[5] == 1.0){
      for(int i = 0 ;i < Figuras.length; i++){  //ciclo para comparar la figura actual con todas las demas
        if (this.id != i){  //condicion para no tomar encuenta la comparacion con la misma figura
          if(this.intersect(Figuras[i])){  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
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
                highlight();
                triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
              popMatrix();
              counter = counter + 1;
            }
            else{
              triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
            }
          }
        }
      }
    }
    if(configuration[5] == 0){
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
                highlight();
                triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
              popMatrix();
              counter++;
            }
            else{
              triangle(this.a.x,this.a.y,this.b.x,this.b.y,this.C.x,this.C.y);
            }
    }   
  }
} 

class Linea extends Figura
{
  Linea(int id_temp, int tam, float[] config)
  {
    super(id_temp, tam, config);
  }
  void update(Figura[] Figuras)
  {
    super.update(Figuras);
  }
  
  void display(Figura[] Figuras) //metodo que dibuja las figuras
  {
    PVector nl = new PVector(0,0);
    PVector n2 = new PVector(0,0);
    if((configuration[12] == 1.0) && (configuration[13] == 0.0)){
      nl.add(this.location);
      highlight();
      ellipseMode(CENTER);
      for(int ii = 0; ii < 60 ;ii++){
        nl.sub(this.velocity);
      }
      if(configuration[9] == 1.0){
        translate(this.velocity.x, this.velocity.y);
        //rotate2D(this.velocity, 10);
        this.velocity.rotate(counter*TWO_PI/360);
      }
      line(this.location.x,this.location.y,nl.x,nl.y);
      counter=1; 
    }
    
    else if((configuration[12] == 1.0) && (configuration[13] == 1.0)){
      nl.add(this.location);
      n2.add(this.location);
      highlight();
      ellipseMode(CENTER);
      float a = velocity.heading2D();
      println(a);
      for(int ii = 0; ii < 30 ;ii++){
        nl.sub(this.velocity);
        n2.add(this.velocity);
      }
      translate(this.velocity.x, this.velocity.y);
      //rotate2D(this.velocity, 10);
      //this.velocity.rotate(counter*TWO_PI/360);
      line(n2.x,n2.y,nl.x,nl.y);
      if (bandera == true){ 
        counter++;
        if(counter == 4){
          bandera = false;
        }
      }
      else if(bandera == false) {
        counter--;
        if(counter == -4){
          bandera = true;
        }
      }
    } 
    else if((configuration[12] == 1.0) && (configuration[13] == 2.0)){
       for(int i = 0 ;i < Figuras.length; i++){  //ciclo para comparar la figura actual con todas las demas
          if (this.id != i){  //condicion para no tomar encuenta la comparacion con la misma figura
            if(this.intersect(Figuras[i])){  //metodo para comparar si hay interseccion de la figura actual con alunas otras del arreglo
              highlight();
              ellipseMode(CENTER);
              nl.add(Figuras[i].location);
              nl.add(this.location);
              nl.div(2);
              float distance = this.location.dist(nl); 
              if(distance >= 10){
                line(this.location.x,this.location.y,nl.x,nl.y);
              }
              nl.x = 0;
              nl.y = 0;
            }
          }
       } 
    }
  }
}
  
