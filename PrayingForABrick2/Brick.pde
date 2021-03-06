class Brick extends PhysicalObject implements Drawable, JSONifiable, GameConstants
{
   protected Health health;
   public Brick(MovingPosition position,
                Size size,
                ColorSet myColor,
                Health health)
   {
      super(position,
            size,
            myColor,
            SHAPE_RECT);
      setHealth(health);
      myColor.setPrimary(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
      myColor.setStroke(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
      setColor(myColor);
      setDoesBounce(true);
   }
   public Brick(Position position,
                Size size,
                ColorSet myColor,
                Health health)
   {
      super(position,
            size,
            myColor,
            SHAPE_RECT);
      setHealth(health);
      myColor.setPrimary(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
      myColor.setStroke(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
      setColor(myColor);
      setDoesBounce(true);
   }
   public Brick()
   {
      super(SHAPE_RECT);
      setHealth(new Health(0) );
      setDoesBounce(true);
   }
   public Health getHealth()
   {
      return health;
   }
   public Brick setHealth(Health health)
   {
      this.health = health;
      return this;
   }
   protected int getAppropriateAlpha()
   {
      if(health.getCurrentHealth() == 0)
         return 0;
      else
         return (int)( (1f - BRICK_MINALPHA) * (health.getCurrentHealth() / health.getMaxHealth() ) + BRICK_MINALPHA);
   }
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("health", getHealth().toJSON() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         Health h = new Health();
         obj.setString("this", super.getClass().getSimpleName() );
         super.fromJSON(obj);
         if(!obj.isNull("health") )
            h.fromJSON(obj.getJSONObject("health") );
         setHealth(h);
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Brick setColor(ColorSet myColor)
   {
      super.setColor(myColor);
      return this;
   }
   public Brick setPosition(MovingPosition position)
   {
      super.setPosition(position);
      return this;
   }
   public Brick setPosition(Position position)
   {
      super.setPosition(position);
      return this;
   }
   public Brick setSize(Size size)
   {
      super.setSize(size);
      return this;
   }
   public Brick update()
   {
      return this;
   }
   public Brick setDoesBounce(boolean doesBounce)
   {
      super.setDoesBounce(doesBounce);
      return this;
   }
   public Brick draw()
   {
      super.draw();
      return this;
   }
}
