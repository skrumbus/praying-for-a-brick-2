class PowerUp extends PhysicalObject
{
   protected int powerUpType;
   protected int state;
   protected int count;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", "PowerUp");
      obj.setJSONObject("powerUpInfo", new JSONObject() );
      obj.getJSONObject("powerUpInfo").setInt("type", getPowerUpType() );
      obj.getJSONObject("powerUpInfo").setInt("state", getState() );
      obj.getJSONObject("powerUpInfo").setInt("count", count);
      return obj;
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
            OBJECT_ELLIPSE);
      setPowerUpType(powerUpType);
      setState(state);
   }
   public int getPowerUpType()
   {
      return powerUpType;
   }
   public void setPowerUpType(int powerUpType)
   {
      if( (powerUpType != POWERUP_WIDE) && //Powerups
          (powerUpType != POWERUP_SLOW) &&
          (powerUpType != POWERUP_FAST) &&
          (powerUpType != POWERUP_DOUBLE) &&
          (powerUpType != POWERUP_CATCH) &&
          (powerUpType != POWERUP_INVINCIBILITY) &&
          (powerUpType != POWERUP_LINE) && 
          (powerUpType != POWERUP_LASER) &&
          (powerUpType != POWERUP_STRONGBALL) &&
          (powerUpType != POWERUP_LASERSHIELD) &&
          
          (powerUpType != POWERDOWN_FAST) && //Powerdowns
          (powerUpType != POWERDOWN_SLOW) &&
          (powerUpType != POWERDOWN_WEAKBALL) &&
          (powerUpType != POWERDOWN_SHORT) )
         powerUpType = 0;
      this.powerUpType = powerUpType;
   }
   public int getState()
   {
      return state;
   }
   public void setState(int state)
   {
      if( (state != POWERUPSTATE_ACTIVE) &&
          (state != POWERUPSTATE_FREE) &&
          (state != POWERUPSTATE_AVAILABLE) )
         state = 0;
      this.state = state;
   }
   public int getCount()
   {
      return count;
   }
   public void setCount(int count)
   {
      if(count < 1)
         count = 1;
      this.count = count;
   }
}