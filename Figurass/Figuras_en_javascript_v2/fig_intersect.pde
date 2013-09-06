//Clase que crea la variable distance de la clase principal
class fig_distance
{
  int id;
  float distance;
  int color_;
  
  fig_distance(int temp_id,float temp_distance, int temp_color_)
  {
    id = temp_id;
    distance = temp_distance;
    color_ = temp_color_;
  }  
}

void begin(float[] config)//----------funcion para inicializar todos los valores------------------------------------
{
  int tot_fig = (int)config[0];
  int tam = (int)config[1];
  Figuras = new Figura[tot_fig];
  size(300,400);
  background(0);
  for (int i = 0; i < Figuras.length; i++)
  {
    float r = random(0,7);
    if ((config[2] == 0.0) && (config[3] == 0.0) && (config[4] == 0.0) && (config[12] == 1.0)){
      Figuras[i] = new Linea(i,tam,config);
    }
    else if ((config[2] == 0.0) && (config[3] == 0.0) && (config[4] == 1.0) && (config[12] == 0.0)){
       Figuras[i] = new Circulo(i,tam,config);
    }  
    else if ((config[2] == 0.0) && (config[3] == 0.0) && (config[4] == 1.0) && (config[12] == 1.0)){
      if (r < 3.5){
         Figuras[i] = new Linea(i,tam,config);
       }
       else{
         Figuras[i] = new Circulo(i,tam,config);                                                                  //TRI   CUA    CIR    LIN
       }
    }  
    else if ((config[2] == 0.0) && (config[3] == 1.0) && (config[4] == 0.0) && (config[12] == 0.0)){
       Figuras[i] = new Cuadro(i,tam,config);
    }  
    else if ((config[2] == 0.0) && (config[3] == 1.0) && (config[4] == 0.0) && (config[12] == 1.0)){
       if (r < 3.5){
         Figuras[i] = new Linea(i,tam,config);
       }
       else{
         Figuras[i] = new Cuadro(i,tam,config);                                                                  //TRI   CUA    CIR    LIN
       }
    }  
    else if ((config[2] == 0.0) && (config[3] == 1.0) && (config[4] == 1.0) && (config[12] == 0.0)){
      if (r < 3.5){
         Figuras[i] = new Cuadro(i,tam,config);
       }
       else{
         Figuras[i] = new Circulo(i,tam,config);
       }
    }  
    else if ((config[2] == 0.0) && (config[3] == 1.0) && (config[4] == 1.0) && (config[12] == 1.0)){
      if (r < 2.33){
        Figuras[i] = new Circulo(i,tam,config);
      }
      else if((r > 2.33) && (r < 4.66) ){
        Figuras[i] = new Cuadro(i,tam,config);
      }   
      else{
        Figuras[i] = new Linea(i,tam,config);
      }
    }
    else if ((config[2] == 1.0) && (config[3] == 0.0) && (config[4] == 0.0) && (config[12] == 0.0)){           //TRI   CUA    CIR    LIN
       Figuras[i] = new Triangule(i,tam,config);
    }
    else if ((config[2] == 1.0) && (config[3] == 0.0) && (config[4] == 0.0) && (config[12] == 1.0)){
      if (r < 3.5){
         Figuras[i] = new Triangule(i,tam,config);
       }
       else{
         Figuras[i] = new Linea(i,tam,config);
       }
    }   
    else if ((config[2] == 1.0) && (config[3] == 0.0) && (config[4] == 1.0) && (config[12] == 0.0)){
      if (r < 3.5){
         Figuras[i] = new Triangule(i,tam,config);
       }
       else{
         Figuras[i] = new Circulo(i,tam,config);
       }
    }
    else if ((config[2] == 1.0) && (config[3] == 0.0) && (config[4] == 1.0) && (config[12] == 1.0)){      //TRI   CUA    CIR    LIN
      if (r < 2.33){
        Figuras[i] = new Circulo(i,tam,config);
      }
      else if((r > 2.33) && (r < 4.66) ){
        Figuras[i] = new Triangule(i,tam,config);
      }   
      else{
        Figuras[i] = new Linea(i,tam,config);
      }
    }  
    else if ((config[2] == 1.0) && (config[3] == 1.0) && (config[4] == 0.0) && (config[12] == 0.0)){
      if (r < 3.5){
         Figuras[i] = new Triangule(i,tam,config);
       }
       else{
         Figuras[i] = new Cuadro(i,tam,config);
       }
    }
    else if ((config[2] == 1.0) && (config[3] == 1.0) && (config[4] == 0.0) && (config[12] == 1.0)){          //TRI   CUA    CIR    LIN
      if (r < 2.33){
        Figuras[i] = new Linea(i,tam,config);
      }
      else if((r > 2.33) && (r < 4.66) ){
        Figuras[i] = new Triangule(i,tam,config);
      }   
      else{
        Figuras[i] = new Cuadro(i,tam,config);
      }
    }   
    else if ((config[2] == 1.0) && (config[3] == 1.0) && (config[4] == 1.0) && (config[12] == 0.0)){
      if (r < 2.33){
        Figuras[i] = new Circulo(i,tam,config);
      }
      else if((r > 2.33) && (r < 4.66) ){
        Figuras[i] = new Triangule(i,tam,config);
      }   
      else{
        Figuras[i] = new Cuadro(i,tam,config);
      }
    }
    else if ((config[2] == 1.0) && (config[3] == 1.0) && (config[4] == 1.0) && (config[12] == 1.0)){                 //TRI   CUA    CIR    LIN
      if (r < 1.75){
        Figuras[i] = new Circulo(i,tam,config);
      }
      else if((r > 1.75) && (r < 3.5) ){
        Figuras[i] = new Triangule(i,tam,config);
      }   
      else if((r > 3.5) && (r < 5.25) ){
        Figuras[i] = new Cuadro(i,tam,config);
      }
      else{
        Figuras[i] = new Linea(i,tam,config);
      }
    }  
    else{
      exit();
    }    
  }
}
void Fondo(){//---------------------------funcion para elegir el color de fondo--------------------------
  int y = 0, col=0;//int(random(0,256));
  if(config[14] == 0){
    background(0);
  }
  else if(config[14] == 1){
    background(255,255,255);
  }
  else if(config[14] == 2){
    for(int i = 0;i < 400;i++){
      noStroke();
      fill(col,255,255,100);
      rect(0,i,300,100);
      if((y % 9) == 0){
        col++; 
      }
      y++;
    }
  }
  else if(config[14] == 3){
    col = int(random(0,256));
    for(int i = 0;i < 400;i++){
      noStroke();
      fill(col,255,255,100);
      rect(0,i,300,100);
      if((y % 9) == 0){
        col++; 
      }
      y++;
    }
  }
}


