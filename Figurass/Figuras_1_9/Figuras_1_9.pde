//Programa principal
//Yovani Felix
//Figura[] Figuras = new Figura[200];
float stop = 0;
Figura[] Figuras;
int total_figuras = 100;      //0
float tamano = 30;//random(10,30); //1
int triangulo =  1;           //2 
int cuadro =     1;           //3
int circulo =    0;           //4
int traslape =   0;           //5
int c_color =    0;           //6
int segir_otro = 0;           //7    seguir o no  0-1
int Const_surface = 1;        //8    restringido o no    0-1 
int rotate_ = 1;              //9    0-1
int moveini = 1;              //10   cuatro movimientosiniciales  0-3
int criterio_color = 0;       //11   0 = tiempo traslape, 1 = distancia traslape

 float[] config = {total_figuras, tamano, triangulo, cuadro, circulo, traslape, c_color, segir_otro, Const_surface, rotate_, moveini, criterio_color};

void setup() 
{
 begin(config);
 background(0);
 colorMode(HSB);
}
void draw() 
{
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
  mouseReleased();
  if(frameCount == 100){
    noLoop();
  }
    
  
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

