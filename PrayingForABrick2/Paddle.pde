class Paddle extends PhysicalObject implements Drawable, JSONifiable
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
      super(OBJECT_RECT);
      setTop(RECT_TOP);
   }
   Paddle(MovingPosition position,
          Size size,
          ColorSet myColor,
          int top)
   {
      super(position,
            size,
            myColor,
            OBJECT_RECT);
            setTop(top);
   }
   Paddle(MovingPosition position,
          Size size,
          ColorSet myColor)
   {
      super(position,
            size,
            myColor,
            OBJECT_RECT);
            setTop(RECT_TOP);
   }
   public int getTop()
   {
      return top;
   }
   public void setTop(int top)
   {
      if( (top != RECT_TOP) &&
          (top != RECT_BOTTOM) &&
          (top != RECT_LEFT) &&
          (top != RECT_RIGHT) )
         top = RECT_TOP;
      this.top = top;
   }
   public Paddle draw()
   {
      super.draw();
      return this;
   }
}