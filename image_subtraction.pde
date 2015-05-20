/**
Program: Image Subtraction
Author: Abdulnasir Mohammed
Class: Computer Graphics
Date: 05/20/15
Credits: Myself
**/

PImage first;
PImage second;



//Usual setup of processing programs. Here the size of the program
//is set to 480 x 500 but it could be anything.
//both images are then loaded into our program.
void setup()
{
  size(480,480);
  first = loadImage("squirrel.jpg");
  second = loadImage("squirrels.jpg");
}

//The control section of our program. 
void draw()
{
  if (mousePressed & (mouseButton == LEFT))
  {
      subtract(first, second);
  }
  
  if (mousePressed & (mouseButton == RIGHT))
  {
     image(first, 0,0);
  }
}



//Takes in 2 images as parameters and returns a new image 
//formed as a result of the subtraction of the original two images.
PImage subtract(PImage img, PImage img2)
{
  color rgb; 
  PImage subtraction = createImage(img.width, img.height, RGB);
  
  for (int i = 0; i < img.width; i++)
  {
    for (int j = 0; j < img.height; j++)
    {
     
      color pixel = img.get(j, i);
      color pixel2 = img2.get(j, i);
  
      int r1 = (int)red(pixel);
      int g1 = (int)green(pixel); 
      int b1 = (int)blue(pixel);
    
      int r2 = (int)red(pixel2);
      int g2 = (int)green(pixel2);
      int b2 = (int)blue(pixel2);
      
    //rgb stores the color of each pixel that has been obtained
     // by subtracting the colors of both images
      rgb = color(r2 - r1, g2 - g1, b2 - b1);
      
      //the new image created is then populated with the pixels within the first image 
      //and then the color scheme is set to the one subtracted = rgb
      subtraction.set(j, i, rgb);
    }
  }
  //subtraction image is drawn to the screen and returned as a variable anywhere its called
    image(subtraction,0, 0);
    saveFrame("subtraction.jpg");
    return subtraction;
}

