//Programa principal
//Yovani Felix
//Figura[] Figuras = new Figura[200];
float stop = 0;
Figura[] Figuras;
int total_figuras = 10;      //0
float tamano = 80;//random(10,30); //1
int triangulo =  0;           //2 
int cuadro =     0;           //3
int circulo =    0;           //4
int traslape =   1;           //5
int c_color =    4;           //6
int segir_otro = 0;           //7    seguir o no  0-1
int Const_surface = 1;        //8    restringido o no    0-1 
int rotate_ =    1;           //9    0-1
int moveini =    3;           //10   cuatro movimientosiniciales  0-3
int criterio_color = 0;       //11 
int linea =      1;           //12
int tipo  =      2;           //13



 float[] config = {total_figuras, tamano, triangulo, cuadro, circulo, traslape, c_color, segir_otro, Const_surface, rotate_, moveini, criterio_color,linea,tipo};

void setup() 
{
 begin(config);
 background(127,0,0);
 colorMode(HSB);
}
void draw() 
{
  //background(127,0,0);
  smooth();
  noFill();
  colorMode(HSB);
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display(Figuras);
  } 
  
//  mouseReleased();
//  if(frameCount == 125){
//    noLoop();
//  }
    
  
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

