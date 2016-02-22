class MenuItem
{
   protected Position position;
   protected ColorSet myColor;
   protected boolean isTicker;
   protected int tickerAmount;
   protected Range tickerRange;
   protected Object item;
   public Object getItem()
   {
      return item;
   }
   public MenuItem setItem (Object item)
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
}