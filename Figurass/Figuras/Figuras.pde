Figura[] Figuras = new Figura[10];
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
//    println(Figuras[1].id);
//    println(Figuras[0].intersectt[0].distance);
//    println(Figuras[0].intersectt[1].distance);
//    println(Figuras[0].intersectt[2].distance);
//    println(Figuras[0].intersectt[3].distance);
//    println(Figuras[0].intersectt[4].distance);
//    println(Figuras[0].intersectt[5].distance);
//    println(Figuras[0].intersectt[6].distance);
//    println(Figuras[0].intersectt[7].distance);
//    println(Figuras[0].intersectt[8].distance);
        
  } 
}
  void mouseReleased() {
  loop();
}
