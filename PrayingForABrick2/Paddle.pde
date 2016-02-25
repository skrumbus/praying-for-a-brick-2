class Paddle extends PhysicalObject implements Drawable, JSONifiable, DirectionConstants, ShapeConstants
{
   protected int top;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setInt("top", getTop() );
      return obj;
   }
   public Paddle fromJSON(JSONObject obj)
   {
      return this;
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
   public Paddle draw()
   {
      super.draw();
      return this;
   }
}