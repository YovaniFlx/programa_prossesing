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
    float r = random(0,4);
    if ((config[2] == 1.0) && (config[3] == 0.0) && (config[4] == 0.0))
    {
      Figuras[i] = new Triangule(i,tam,config);
    }
    else if ((config[2] == 1.0) && (config[3] == 1.0) && (config[4] == 0.0))
    {
       if (r < 2)
       {
         Figuras[i] = new Triangule(i,tam,config);
       }
       else
       {
         Figuras[i] = new Cuadro(i,tam,config);
       }
    }  
    else if ((config[2] == 1.0) && (config[3] == 0.0) && (config[4] == 1.0))
    {
      if (r < 2)
       {
         Figuras[i] = new Triangule(i,tam,config);
       }
       else
       {
         Figuras[i] = new Circulo(i,tam,config);
       }
    }  
    else if ((config[2] == 0.0) && (config[3] == 1.0) && (config[4] == 0.0))
    {
       Figuras[i] = new Cuadro(i,tam,config);
       
    }  
    else if ((config[2] == 0.0) && (config[3] == 0.0) && (config[4] == 1.0))
    {
       Figuras[i] = new Circulo(i,tam,config);
       
    }  
    else if ((config[2] == 0.0) && (config[3] == 1.0) && (config[4] == 1.0))
    {
      if (r < 2)
       {
         Figuras[i] = new Cuadro(i,tam,config);
       }
       else
       {
         Figuras[i] = new Circulo(i,tam,config);
       }
    }  
    else
    {
      if (r < 2)
      {
        Figuras[i] = new Circulo(i,tam,config);
      }
      else if((r > 2) && (r < 3) )
      {
        Figuras[i] = new Cuadro(i,tam,config);
      }   
      else
      {
        Figuras[i] = new Triangule(i,tam,config);
      }
    }    
  }
}
