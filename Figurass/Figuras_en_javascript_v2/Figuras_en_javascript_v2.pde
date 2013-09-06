//Programa principal
//Yovani Felix
//Figura[] Figuras = new Figura[200];
float stop = 0;
Figura[] Figuras;
int total_figuras = 20;      //0
float tamano = 80;//random(10,30); //1   Elige el tamaño de las figuras
int triangulo =  0;           //2        0-No dibuja triangulo, 1-si lo dibuja
int cuadro =     0;           //3        0-No dibuja cuadro, 1-si lo dibuja
int circulo =    0;           //4        0-No dibuja circulo, 1-si lo dibuja
int traslape =   1;           //5        0-No toma en cuenta el traslape, 1-si lo toma en cuenta
int c_color =    4;           //6        0-un solo color,1-de una paleta de colores,2-amarillo blanco,3-colores,4-escala de grices
int segir_otro = 0;           //7        0-no toma en cuenta, 1-seguir 
int Const_surface = 0;        //8        0-restringido , 1-no restringido  
int rotate_ =    1;           //9        0-No toma en cuenta, 1-Rotacion
int moveini =    3;           //10       0-inicia del centro,1-el eje x inicia del centro,2-el eje y inicia del centro,3-aleatorio x y
int criterio_color = 0;       //11       0-solo contorno, 1-relleno
int linea =      1;           //12       0-No dibuja linea, 1-si lo dibuja
int tipo  =      2;           //13       controla el tipo de la linea 0-2
int fondo =      3;           //14       Controla el color del fondo de 0-3



 float[] config = {total_figuras, tamano, triangulo, cuadro, circulo, traslape, c_color, segir_otro, Const_surface, rotate_, moveini, criterio_color,linea,tipo,fondo};

void setup() 
{
 colorMode(HSB);
 begin(config);
 Fondo();
}
void draw() 
{
  //background(127,0,0);
  smooth();
  noFill();
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].update(Figuras);     
  } 
  for(int i = 0;i < Figuras.length;i++)
  {
    Figuras[i].display(Figuras);
  } 
  
  mouseReleased();
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

