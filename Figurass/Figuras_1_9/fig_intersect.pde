//Clase que crea la variable intersectt de la clase principal
class fig_distance
{
  int id;
  float distance;
  
  fig_distance(int temp_id,float temp_distance)
  {
    id = temp_id;
    distance = temp_distance;
  }  
}

void begin()
{
  size(400,400);
  background(0);
  for (int i = 0; i < Figuras.length; i++)
  {
    float r = random(0,4);
    if (r < 2)
    {
      Figuras[i] = new Circulo(i);
    }
    else if((r > 2) && (r < 3) )
    {
      Figuras[i] = new Cuadro(i);
    }   
    else
    {
      Figuras[i] = new Triangule(i);
    }
  }
}
