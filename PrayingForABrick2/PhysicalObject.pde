class PhysicalObject implements Drawable, JSONifiable, ShapeConstants
{
   protected MovingPosition position;
   protected Size size;
   protected ColorSet myColor;
   protected int type; //0 = rect; 1 = circle;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("position", getPosition().toJSON() );
      obj.setJSONObject("size", getSize().toJSON() );
      obj.setJSONObject("color", getColor().toJSON() );
      obj.setInt("type", getType() );
      return obj;
   }
   public PhysicalObject fromJSON(JSONObject obj)
   {
      return this;
   }
   public PhysicalObject()
   {
      setPosition(new MovingPosition() );
      setSize(new Size() );
      setColor(new ColorSet() );
      setType(0);
   }
   public PhysicalObject(int type)
   {
      setPosition(new MovingPosition() );
      setSize(new Size() );
      setColor(new ColorSet() );
      setType(type);
   }
   public PhysicalObject(MovingPosition position,
                         Size size,
                         ColorSet myColor,
                         int type)
   {
      setPosition(position);
      setSize(size);
      setColor(myColor);
      setType(type);
   }
   public PhysicalObject(Position position, //stationary object
                         Size size,
                         ColorSet myColor,
                         int type)
   {
      setPosition(new MovingPosition(position.getX(), position.getY() ) );
      setSize(size);
      setColor(myColor);
      setType(type);
   }
   public Size getSize()
   {
      return size;
   }
   public PhysicalObject setSize(Size size)
   {
      this.size = size;
      return this;
   }
   public MovingPosition getPosition()
   {
      return position;
   }
   public PhysicalObject setPosition(MovingPosition position)
   {
      this.position = position;
      return this;
   }
   public PhysicalObject setPosition(Position position)
   {
      this.position = new MovingPosition(position.getX(), position.getY() );
      return this;
   }
   public ColorSet getColor()
   {
      return myColor;
   }
   public PhysicalObject setColor(ColorSet myColor)
   {
      this.myColor = myColor;
      return this;
   }
   public int getType()
   {
      return type;
   }
   public PhysicalObject setType(int type)
   {
      if( (type == SHAPE_ELLIPSE) ||
          (type == SHAPE_RECT) )
         this.type = type;
      else
         this.type = 0;
      return this;
   }
   public PhysicalObject draw()
   {
      getColor().draw();
      switch(getType() )
      {
         case SHAPE_RECT:
            rect(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
            break;
         case SHAPE_ELLIPSE:
            ellipse(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
            break;
      }
      return this;
   }
}