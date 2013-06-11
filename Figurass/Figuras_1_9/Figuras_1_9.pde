//Programa principal
//Yovani Felix
//Figura[] Figuras = new Figura[200];
Figura[] Figuras;
int total_figuras = 100;      //0
float tamano = 30;//random(10,30); //1
int triangulo =  0;           //2 
int cuadro =     0;           //3
int circulo =    1;           //4
int traslape =   1;           //5
int c_color =    1;           //6
int segir_otro = 0;           //7    seguir o no  0-1
int Const_surface = 0;        //8    restringido o no    0-1 
int rotate_ = 1;              //9    0-1
int moveini = 2;              //10   cuatro movimientosiniciales  0-3

float[] config = {total_figuras, tamano, triangulo, cuadro, circulo, traslape, c_color, segir_otro, Const_surface, rotate_, moveini};

void setup() 
{
 begin(config);
 background(#00A7E5);
}
void draw() 
{
  smooth();
  noFill();
  //background(#00A7E5);
  //background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display();
  } 
  //println(config);
}
  
