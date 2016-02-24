class MenuItem implements Drawable, JSONifiable
{
   protected Position position;
   protected ColorSet mainColor, highlightColor;
   protected boolean isTicker;
   protected int tickerAmount;
   protected Range tickerRange;
   protected Drawable item;
   protected Size size;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setBoolean("isTicker", getIsTicker() );
      obj.setInt("tickerAmount", getTickerAmount() );
      obj.setJSONObject("tickerRange", getTickerRange().toJSON() );
      obj.setJSONObject("position", getPosition().toJSON() );
      obj.setJSONObject("mainColor", getColor().toJSON() );
      obj.setJSONObject("highlightColor", getHighlight().toJSON() );
      if(item instanceof JSONifiable)
         obj.setJSONObject("item", ( (JSONifiable)getItem() ).toJSON() );
      obj.setJSONObject("size", getSize().toJSON() );
      return obj;
   }
   public MenuItem fromJSON(JSONObject obj)
   {
      return this;
   }
   public MenuItem()
   {
      setIsTicker(false);
      setTickerAmount(0);
      setPosition(new Position(0, 0) );
      setColor(new ColorSet()
                   .setPrimary(color(#000000, 0) )
                   .setStroke(color(#000000, 0) ) );
      setTickerRange(new Range(0, 0) );
      setItem(new PhysicalObject() );
   }
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
      return mainColor;
   }
   public MenuItem setColor(ColorSet mainColor)
   {
      this.mainColor = mainColor;
      return this;
   }
   public ColorSet getHighlight()
   {
      return highlightColor;
   }
   public MenuItem setHighlight(ColorSet highlightColor)
   {
      this.highlightColor = highlightColor;
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