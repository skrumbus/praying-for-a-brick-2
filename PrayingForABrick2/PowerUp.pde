class PowerUp extends PhysicalObject implements JSONifiable, GameConstants
{
   protected int powerUpType;
   protected int state;
   protected int count;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setInt("type", getPowerUpType() );
      obj.setInt("state", getState() );
      obj.setInt("count", count);
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("type") )
            setType(obj.getInt("type") );
         else
            setType(0);
         if(!obj.isNull("state") )
            setState(obj.getInt("state") );
         else
            setState(0);
         if(!obj.isNull("count") )
            setCount(obj.getInt("count") );
         else
            setCount(0);
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public PowerUp(MovingPosition position,
                  float r,
                  ColorSet myColor,
                  int powerUpType,
                  int state)
   {
      super(position,
            new Size(r * 2, r * 2),
            myColor,
            SHAPE_ELLIPSE);
      setPowerUpType(powerUpType);
      setState(state);
      setDoesBounce(false);
   }
   public PowerUp()
   {
      super();
      setPowerUpType(0);
      setState(0);
      setDoesBounce(false);
   }
   public int getPowerUpType()
   {
      return powerUpType;
   }
   public PowerUp setPowerUpType(int powerUpType)
   {
      if( (powerUpType != POWERUP_WIDEPADDLE) && //Powerups
          (powerUpType != POWERUP_SLOWBALL) &&
          (powerUpType != POWERUP_FASTPADDLE) &&
          (powerUpType != POWERUP_DOUBLE) &&
          (powerUpType != POWERUP_CATCH) &&
          (powerUpType != POWERUP_INVINCIBILITY) &&
          (powerUpType != POWERUP_LINEBREAK) && 
          (powerUpType != POWERUP_LASER) &&
          (powerUpType != POWERUP_STRONGBALL) &&
          (powerUpType != POWERUP_LASERSHIELD) &&
          
          (powerUpType != POWERDOWN_FASTBALL) && //Powerdowns
          (powerUpType != POWERDOWN_SLOWPADDLE) &&
          (powerUpType != POWERDOWN_WEAKBALL) &&
          (powerUpType != POWERDOWN_SHORTPADDLE) )
         powerUpType = 0;
      else
         this.powerUpType = powerUpType;
      return this;
   }
   public int getState()
   {
      return state;
   }
   public PowerUp setState(int state)
   {
      if( (state != POWERUPSTATE_ACTIVE) &&
          (state != POWERUPSTATE_FREE) &&
          (state != POWERUPSTATE_AVAILABLE) )
         state = 0;
      this.state = state;
      return this;
   }
   public int getCount()
   {
      return count;
   }
   public PowerUp setCount(int count)
   {
      if(count < 1)
         count = 1;
      this.count = count;
      return this;
   }
   public PowerUp setDoesBounce(boolean doesBounce)
   {
      super.setDoesBounce(doesBounce);
      return this;
   }
}
