class PowerUp extends PhysicalObject implements JSONifiable, GameConstants
{
   public final int POWERUP_CATCH = 1;
   public final int POWERUP_INVINCIBILITY = 2;
   public final int POWERUP_WIDEPADDLE = 3;
   public final int POWERUP_SLOWBALL = 4;
   public final int POWERUP_FASTPADDLE = 5;
   public final int POWERUP_LASER = 6;
   public final int POWERUP_LINEBREAK = 7;
   public final int POWERUP_DOUBLE = 8;
   public final int POWERUP_STRONGBALL = 9;
   public final int POWERUP_LASERSHIELD = 10;
   
   public final int POWERDOWN_SHORTPADDLE = -1;
   public final int POWERDOWN_SLOWPADDLE = -2;
   public final int POWERDOWN_FASTBALL = -3;
   public final int POWERDOWN_WEAKBALL = -4;

   public final int POWERUPSTATE_FREE = 1;
   public final int POWERUPSTATE_AVAILABLE = 2;
   public final int POWERUPSTATE_ACTIVE = 3;

   protected int powerUpType;
   protected int state;
   protected int count;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("powerUpInfo", new JSONObject() );
      obj.getJSONObject("powerUpInfo").setInt("type", getPowerUpType() );
      obj.getJSONObject("powerUpInfo").setInt("state", getState() );
      obj.getJSONObject("powerUpInfo").setInt("count", count);
      return obj;
   }
   public PowerUp fromJSON(JSONObject obj)
   {
      return this;
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
}
