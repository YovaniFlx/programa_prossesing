//Programa principal
//Yovani Felix
Figura[] Figuras = new Figura[200];
void setup() 
{
 begin();
}
void draw() 
{
  smooth();
  noFill();
  background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display();
  } 
  //println(frameCount);
}
  
