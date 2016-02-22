class MovingPosition extends Position
{
   protected float speed;
   protected Range speedRange;
   protected float deltaX, deltaY;
   protected Range xRange, yRange;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", "MovingPosition");
      obj.setJSONObject("x", new JSONObject() );
      obj.getJSONObject("x").setFloat("x", getX() );
      obj.getJSONObject("x").setFloat("delta", getDeltaX() );
      obj.getJSONObject("x").setJSONObject("range", getXRange().toJSON() );
      obj.setJSONObject("y", new JSONObject() );
      obj.getJSONObject("y").setFloat("y", getY() );
      obj.getJSONObject("y").setFloat("delta", getDeltaY() );
      obj.getJSONObject("y").setJSONObject("range", getYRange().toJSON() );
      obj.setJSONObject("speed", new JSONObject() );
      obj.getJSONObject("speed").setFloat("speed", getSpeed() );
      obj.getJSONObject("speed").setJSONObject("range", getSpeedRange().toJSON() );
      return obj;
   }
   public MovingPosition()
   {
      setSpeedRange(new Range(0, 0) );
      setSpeed(0);
      setDeltas(0, 0);
      setXRange(new Range(0, 0) );
      setYRange(new Range(0, 0) );
      setX(0);
      setY(0);
   }
   public MovingPosition(float x, float y)
   {
      setSpeedRange(new Range(0, 0) );
      setSpeed(0);
      setDeltas(0, 0);
      setXRange(new Range(x, x) );
      setYRange(new Range(y, y) );
      setX(x);
      setY(y);
   }
   public MovingPosition(float x, float y,
                         Range xRange, Range yRange,
                         float speed, 
                         Range speedRange,
                         float deltaX, float deltaY)
   {
      setSpeedRange(speedRange);
      setSpeed(speed);
      setDeltas(deltaX, deltaY);
      setXRange(xRange);
      setYRange(yRange);
      setX(x);
      setY(y);
   }
   public MovingPosition setX(float x)
   {
      if(xRange != null && x < getXRange().getMin() )
         x = getXRange().getMin();
      else if(xRange != null && x > getXRange().getMax() )
         x = getXRange().getMax();
      this.x = x;
      return this;
   }
   public float getDeltaX()
   {
      return deltaX;
   }
   protected MovingPosition setDeltaX(float deltaX)
   {
      this.deltaX = deltaX;
      return this;
   }
   public Range getXRange()
   {
      return xRange;
   }
   public MovingPosition setXRange(Range xRange)
   {
      this.xRange = xRange;
      return this;
   }
   public MovingPosition setY(float y)
   {
      if(yRange != null && y < getYRange().getMin() )
         y = getYRange().getMin();
      else if(yRange != null && y > getYRange().getMax() )
         y = getYRange().getMax();
      this.y = y;
      return this;
   }
   public float getDeltaY()
   {
      return deltaY;
   }
   public MovingPosition setDeltaY(float deltaY)
   {
      this.deltaY = deltaY;
      return this;
   }
   public Range getYRange()
   {
      return yRange;
   }
   public MovingPosition setYRange(Range yRange)
   {
      this.yRange = yRange;
      return this;
   }
   public MovingPosition setDeltas(float deltaX, float deltaY)
   {
      float multiplier;
      setDeltaX(deltaX);
      setDeltaY(deltaY);
      multiplier = getMultiplier(deltaX, deltaY);
      setDeltaX(deltaX * multiplier);
      setDeltaY(deltaY * multiplier);
      return this;
   }
   public float getSpeed()
   {
      return speed;
   }
   public MovingPosition setSpeed(float speed)
   {
      if(speed < getSpeedRange().getMin() )
         speed = getSpeedRange().getMin();
      else if(speed > getSpeedRange().getMax() )
         speed = getSpeedRange().getMax();
      this.speed = speed;
      return this;
   }
   public Range getSpeedRange()
   {
      return speedRange;
   }
   public MovingPosition setSpeedRange(Range speedRange)
   {
      this.speedRange = speedRange;
      return setSpeed(getSpeed() );
   }
   protected float getNewSpeed(float deltaX, float deltaY)
   {
      return sqrt(pow(deltaX, 2) + pow(deltaY, 2) );
   }
   protected float getMultiplier(float deltaX, float deltaY)
   {
      if (getSpeedRange().getMax() == 0 || (deltaY == 0 && deltaX == 0) )
         return 0;
      else
         return getSpeed() / getNewSpeed(deltaX, deltaY);
   }
   public MovingPosition advance()
   {
      setX(getXRange().constrainValue(getX() + getDeltaX() ) );
      setY(getYRange().constrainValue(getY() + getDeltaY() ) );
      return this;
   }
   public MovingPosition advance(boolean doX, boolean doY)
   {
      if(doX)
         setX(getXRange().constrainValue(getX() + getDeltaX() ) );
      if(doY)
         setY(getYRange().constrainValue(getY() + getDeltaY() ) );
      return this;
   }
}