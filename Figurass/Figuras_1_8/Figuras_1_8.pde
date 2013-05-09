//Programa principal
//Yovani Felix
Figura[] Figuras = new Figura[200];
void setup() 
{
  size(400,400);
  //size(200,200);
  background(0);
  for (int i = 0; i < Figuras.length; i++)
  {
    float r = random(0,2);
    if (r < 1)
    {
      Figuras[i] = new Circulo(i);
    }
    else
    {
      Figuras[i] = new Cuadro(i);
    }   
  }
}
void draw() 
{
  smooth();
  noFill();
  //background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display();
  } 
  println(frameCount);
//  if(frameCount == 1500)
//  {
//    noLoop();
//  }
}
  void mouseReleased() {
  loop();
}
