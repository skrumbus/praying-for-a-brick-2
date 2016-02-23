class MenuItem implements Drawable
{
   protected Position position;
   protected ColorSet myColor;
   protected boolean isTicker;
   protected int tickerAmount;
   protected Range tickerRange;
   protected Drawable item;
   protected Size size;
   public Object getItem()
   {
      return item;
   }
   public MenuItem setItem (Drawable item)
   {
      this.item = item;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public MenuItem setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public Size getSize()
   {
      return size;
   }
   public MenuItem setSize(Size size)
   {
      this.size = size;
      return this;
   }
   public ColorSet getColor()
   {
      return myColor;
   }
   public MenuItem setColor(ColorSet myColor)
   {
      this.myColor = myColor;
      return this;
   }
   public boolean getIsTicker()
   {
      return isTicker;
   }
   public MenuItem setIsTicker(boolean isTicker)
   {
      this.isTicker = isTicker;
      return this;
   }
   public int getTickerAmount()
   {
      return tickerAmount;
   }
   public MenuItem setTickerAmount(int tickerAmount)
   {
      this.tickerAmount = (int) tickerRange.constrainValue( (float) tickerAmount);
      return this;
   }
   public Range getTickerRange()
   {
      return tickerRange;
   }
   public MenuItem setTickerRange(Range tickerRange)
   {
      this.tickerRange = tickerRange;
      return this;
   }
   protected void drawTickers()
   {
      
   }
   public MenuItem draw()
   {
      getColor().draw();
      rect(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
      if(getIsTicker() )
         drawTickers();
      item.draw();
      return this;
   }
}
