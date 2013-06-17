//Programa principal
//Yovani Felix
//Figura[] Figuras = new Figura[200];
float stop = 0;
Figura[] Figuras;
int total_figuras = 200;      //0
float tamano = 30;//random(10,30); //1
int triangulo =  0;           //2 
int cuadro =     1;           //3
int circulo =    0;           //4
int traslape =   1;           //5
int c_color =    1;           //6
int segir_otro = 0;           //7    seguir o no  0-1
int Const_surface = 1;        //8    restringido o no    0-1 
int rotate_ = 1;              //9    0-1
int moveini = 1;              //10   cuatro movimientosiniciales  0-3

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
  //background(#edc07a);
  //background(255);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display();
  } 
  mouseReleased();
}
 void mousePressed()
 {
   if((stop % 2) == 0)
  {
    noLoop();
    stop ++;
  }
  else
  {
    loop();
    stop++;
  }
}

