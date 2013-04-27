Figura[] Figuras = new Figura[3];
void setup() 
{
  size(640,360);
  for (int i = 0; i < Figuras.length; i++)
  {
    Figuras[i] = new Figura(i);   
  }
}
void draw() 
{
  smooth();
  background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
        Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
        Figuras[i].display();     
  } 
}
