interface Drawable
{
   public final int OBJECT_RECT = 1;
   public final int OBJECT_ELLIPSE = 2;
   
   public final int RECT_TOP = 0;
   public final int RECT_RIGHT = 1;
   public final int RECT_BOTTOM = 2;
   public final int RECT_LEFT = 3;
   
   public Object draw();
}