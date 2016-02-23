class Menu implements Drawable
{
   protected Vector<MenuItem> items;
   protected ColorSet myColor;
   protected Position position;
   protected Size size;
   Text title;
   public Vector<MenuItem> getItems()
   {
      return items;
   }
   public ColorSet getColor()
   {
      return myColor;
   }
   public Menu setColor(ColorSet myColor)
   {
      this.myColor = myColor;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public Menu setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public Size getSize()
   {
      return size;
   }
   public Menu setSize(Size size)
   {
      this.size = size;
      return this;
   }
   public Text getTitle()
   {
      return title;
   }
   public Menu setTitle(Text title)
   {
      this.title = title;
      return this;
   }
   public Menu fixItemPositions(Boolean isVertical)
   {
      //evenly distribute menuItems across menu
      return this;
   }
   public Menu fixItemPositions() //assuming a vertical menu
   {
      //evenly distribute menuItems across menu
      return this;
   }
   public Menu draw()
   {
      getColor().draw();
      rect(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
      getTitle().draw();
      for(MenuItem item : getItems() )
         item.draw();
      return this;
   }
}
