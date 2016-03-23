class Paddle extends PhysicalObject implements Drawable, JSONifiable, GameConstants
{
   protected int top;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setInt("top", getTop() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         obj.setString("this", super.getClass().getSimpleName() );
         super.fromJSON(obj);
         if(!obj.isNull("top") )
            setTop(obj.getInt("top") );
         else
            setTop(DIRECTION_UP);
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   Paddle()
   {
      super(SHAPE_RECT);
      setTop(DIRECTION_UP);
   }
   Paddle(MovingPosition position,
          Size size,
          ColorSet myColor,
          int top)
   {
      super(position,
            size,
            myColor,
            SHAPE_RECT);
            setTop(top);
   }
   Paddle(MovingPosition position,
          Size size,
          ColorSet myColor)
   {
      super(position,
            size,
            myColor,
            SHAPE_RECT);
            setTop(DIRECTION_UP);
   }
   public int getTop()
   {
      return top;
   }
   public Paddle setTop(int top)
   {
      if( (top != DIRECTION_UP) &&
          (top != DIRECTION_DOWN) &&
          (top != DIRECTION_LEFT) &&
          (top != DIRECTION_RIGHT) )
         top = DIRECTION_UP;
      this.top = top;
      return this;
   }
   public Paddle setSize(Size size)
   {
      super.setSize(size);
      return this;
   }
   public Paddle setPosition(MovingPosition position)
   {
      super.setPosition(position);
      return this;
   }
   public Paddle setColor(ColorSet myColor)
   {
      super.setColor(myColor);
      return this;
   }
   public Paddle setType(int type)
   {
      super.setType(type);
      return this;
   }
   public Paddle setDoesBounce(boolean doesBounce)
   {
      super.setDoesBounce(doesBounce);
      return this;
   }
   public Paddle draw()
   {
      super.draw();
      return this;
   }
}
