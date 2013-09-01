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

void begin(float[] config)
{
  int tot_fig = (int)config[0];
  int tam = (int)config[1];
  Figuras = new Figura[tot_fig];
  size(400,400);
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
