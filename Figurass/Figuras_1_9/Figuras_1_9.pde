//Programa principal
//Yovani Felix
//Figura[] Figuras = new Figura[200];
Figura[] Figuras;
int total_figuras = 100;      //0
float tamano = random(10,30); //1
int triangulo =  1;           //2 
int cuadro =     1;           //3
int circulo =    1;           //4
int traslape =   1;           //5
int c_color =    1;           //6
int segir_otro = 1;           //7
int Const_surface = 1;        //8
int rotate_ = 1;              //9


float[] config = {total_figuras, tamano, triangulo, cuadro, circulo, traslape, c_color, segir_otro, Const_surface, rotate_};

void setup() 
{
 begin(config);
}
void draw() 
{
  smooth();
  //noFill();
  background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display();
  } 
  println(config);
}
  
