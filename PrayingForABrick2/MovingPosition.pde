class MovingPosition extends Position implements JSONifiable
{
   protected Range speedRange;
   protected float deltaX, deltaY;
   protected Range xRange, yRange;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("x", new JSONObject() );
      obj.getJSONObject("x").setFloat("x", getX() );
      obj.getJSONObject("x").setFloat("delta", getDeltaX() );
      obj.getJSONObject("x").setJSONObject("range", getXRange().toJSON() );
      obj.setJSONObject("y", new JSONObject() );
      obj.getJSONObject("y").setFloat("y", getY() );
      obj.getJSONObject("y").setFloat("delta", getDeltaY() );
      obj.getJSONObject("y").setJSONObject("range", getYRange().toJSON() );
      obj.setJSONObject("speedRange", getSpeedRange().toJSON() );
      return obj;
   }
   protected float checkAndReturn(JSONObject obj, String name, float def)
   {
      if(!obj.isNull(name) )
         return obj.getFloat(name);
      else
         return def;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("x") )
         {
            setX(checkAndReturn(obj.getJSONObject("x"), "x", 0) );
            setDeltaX(checkAndReturn(obj.getJSONObject("x"), "delta", 0) );
            if(!obj.getJSONObject("x").isNull("range") )
            {
               Range r = new Range();
               r.fromJSON(obj.getJSONObject("x").getJSONObject("range") );
               setXRange(r);
            }
            else
               setXRange(new Range(getX(), getX() ) );
         }
         else
         {
            setX(0);
            setDeltaX(0);
            setXRange(new Range(getX(), getX() ) );
         }
         if(!obj.isNull("y") )
         {
            setY(checkAndReturn(obj.getJSONObject("y"), "y", 0) );
            setDeltaY(checkAndReturn(obj.getJSONObject("y"), "delta", 0) );
            if(!obj.getJSONObject("y").isNull("range") )
            {
               Range r = new Range();
               r.fromJSON(obj.getJSONObject("y").getJSONObject("range") );
               setYRange(r);
            }
            else
               setYRange(new Range(getY(), getY() ) );
         }
         else
         {
            setY(0);
            setDeltaY(0);
            setYRange(new Range(getY(), getY() ) );
         }
         if(!obj.isNull("speedRange") )
         {
            Range r = new Range();
            r.fromJSON(obj.getJSONObject("speedRange") );
            setSpeedRange(r);
         }
         else
            setSpeedRange(new Range() );
         setDeltaY(getDeltaY() * getMultiplier(getDeltaX(), getDeltaY() ) );
         setDeltaX(getDeltaX() * getMultiplier(getDeltaX(), getDeltaY() ) );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public MovingPosition()
   {
      setSpeedRange(new Range(0, 0) );
      setDeltas(0, 0);
      setXRange(new Range(0, 0) );
      setYRange(new Range(0, 0) );
      setX(0);
      setY(0);
   }
   public MovingPosition(float x, float y)
   {
      setSpeedRange(new Range(0, 0) );
      setDeltas(0, 0);
      setXRange(new Range(x, x) );
      setYRange(new Range(y, y) );
      setX(x);
      setY(y);
   }
   public MovingPosition(float x, float y,
                         Range xRange, Range yRange,
                         Range speedRange,
                         float deltaX, float deltaY)
   {
      setSpeedRange(speedRange);
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
   public MovingPosition setDeltaX(float deltaX)
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
      float multiplier = getMultiplier(deltaX, deltaY);
      setDeltaX(deltaX * multiplier);
      setDeltaY(deltaY * multiplier);
      return this;
   }
   public Range getSpeedRange()
   {
      return speedRange;
   }
   public MovingPosition setSpeedRange(Range speedRange)
   {
      this.speedRange = speedRange;
      return this;
   }
   public float getCurrentSpeed()
   {
      return sqrt(pow(deltaX, 2) + pow(deltaY, 2) );
   }
   protected float getNewSpeed(float deltaX, float deltaY)
   {
      return sqrt(pow(deltaX, 2) + pow(deltaY, 2) );
   }
   protected float getMultiplier(float deltaX, float deltaY)
   {
      if (getNewSpeed(deltaX, deltaY) == 0)
         return 0;
      else if(sqrt(pow(getDeltaX(), 2) + pow(getDeltaY(), 2) ) <= getSpeedRange().getMax() )
        return 1;
      else
         return getSpeedRange().getMax() / getNewSpeed(deltaX, deltaY);
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
