//Programa principal
//Yovani Felix
Circulo[] Figuras = new Circulo[50];
Cuadro[] Figuras2 = new Cuadro[10];
void setup() 
{
  size(640,360);
  for (int i = 0; i < Figuras.length; i++)
  {
    Figuras[i] = new Circulo(i);
    //Figuras2[i] = new Cuadro(i);   
  }
}
void draw() 
{
  smooth();
  background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
    //Figuras2[i].update(Figuras);
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display();
    //Figuras2[i].display();
  } 
}
  void mouseReleased() {
  loop();
}
