class Recta extends Rect
{
   public Recta()
   {
     super();
   }
   public Recta(int x, int y, int height, int width)
   {
    super();
    this.x=x;
    this.y=y;
    this.height=height;
    this.width=width;
   }
   
   
      public Recta(int x, int y, int height, int width, int penThickness,color c)
   {
    super();
    this.x=x;
    this.y=y;
    this.height=height;
    this.width=width;
    this.penThickness=penThickness;
    this.brush=c;
   }
   
   public String toString()
   { return "X: "+ x + ", Y: "+ y + ", height:" + this.height + ", width: " + this.width;   }
}

class Ellipsa extends Ellipse
{
   public Ellipsa()
   {
     super();
   }
   
   public Ellipsa(int x, int y, int radiusX, int radiusY)
   {
     super();
     this.x=x;
     this.y=y;
     this.radiusX=radiusX;
     this.radiusY=radiusY;
   }
}

class Image2 extends Image
{
 public Image2()
 { super(); }
 
 public Image2(int x, int y, int width, int height, String path)
 {
    super();
    this.x=x;
    this.y=y;
    this.height=height;
    this.width=width;
    setImage(path);

}
}
