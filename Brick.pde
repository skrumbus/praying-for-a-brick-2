class Brick extends PhysicalObject
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
            OBJECT_RECT);
      setHealth(health);
      myColor.setPrimary(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
      myColor.setStroke(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
   }
   public Brick(Position position,
                Size size,
                ColorSet myColor)
   {
      super(position,
            size,
            myColor,
            OBJECT_RECT);
      setHealth(health);
      myColor.setPrimary(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
      myColor.setStroke(color(red(myColor.getPrimary() ), 
                               green(myColor.getPrimary() ), 
                               blue(myColor.getPrimary() ), 
                               getAppropriateAlpha() ) );
   }
   public Brick()
   {
      super(OBJECT_RECT);
      setHealth(new Health(0) );
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
      obj.setString("this","Brick");
      obj.setJSONObject("health", health.toJSON() );
      return obj;
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
}