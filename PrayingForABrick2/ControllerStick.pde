class ControllerStick extends ControllerButton implements JSONifiable, GameConstants
{
   protected Position position;
   protected Range xRange, yRange;
   protected ControllerButton[] engagedDirections = new ControllerButton[4];
   protected float threshold;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("stick", new JSONObject() );
      obj.getJSONObject("stick").setJSONObject("position", getPosition().toJSON() );
      obj.getJSONObject("stick").setJSONObject("xRange", getXRange().toJSON() );
      obj.getJSONObject("stick").setJSONObject("yRange", getYRange().toJSON() );
      obj.getJSONObject("stick").setJSONArray("engagedDirections", new JSONArray() );
      for(int i = 0; i < getEngagedDirections().length; i++)
         obj.getJSONObject("stick").getJSONArray("engagedDirections").setJSONObject(i, getEngagedDirections()[i].toJSON() );
      obj.getJSONObject("stick").setFloat("threshold", getThreshold() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         obj.setString("this", super.getClass().getSimpleName() );
         super.fromJSON(obj);
         if(!obj.isNull("stick") )
         {
            Position p = new Position();
            Range x = new Range(), y = new Range();
            if(!obj.getJSONObject("stick").isNull("threshold") )
               setThreshold(obj.getJSONObject("stick").getFloat("threshold") );
            else
               setThreshold(.75);
            if(!obj.getJSONObject("stick").isNull("engagedDirections") )
               for(int i = 0; i < getEngagedDirections().length; i++)
               {
                  ControllerButton b = new ControllerButton();
                  b.fromJSON(obj.getJSONObject("stick").getJSONArray("engagedDirections").getJSONObject(i) );
                  getEngagedDirections()[i] = b;
               }
            else
               for(int i = 0; i < getEngagedDirections().length; i++)
               {
                  ControllerButton b = new ControllerButton();
                  b.fromJSON(obj.getJSONObject("stick").getJSONArray("engagedDirections").getJSONObject(i) );
                  getEngagedDirections()[i] = b;
               }
            if(!obj.getJSONObject("stick").isNull("position") )
               p.fromJSON(obj.getJSONObject("stick").getJSONObject("position") );
            if(!obj.getJSONObject("stick").isNull("xRange") )
               x.fromJSON(obj.getJSONObject("stick").getJSONObject("xRange") );
            if(!obj.getJSONObject("stick").isNull("yRange") )
               y.fromJSON(obj.getJSONObject("stick").getJSONObject("yRange") );
            setPosition(p);
            setXRange(x);
            setYRange(y);
         }
         else
         {
            setPosition(new Position(0, 0) );
            setXRange(new Range(0, 0) );
            setYRange(new Range(0, 0) );
            for(int i = 0; i < getEngagedDirections().length; i++)
               getEngagedDirections()[i] = new ControllerButton(getIsDirectionEngaged(i) );
            setThreshold(.75);
         }
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public ControllerStick()
   {
      super();
      setPosition(new Position(0, 0) );
      setXRange(new Range(0, 0) );
      setYRange(new Range(0, 0) );
      for(int i = 0; i < getEngagedDirections().length; i++)
         getEngagedDirections()[i] = new ControllerButton(getIsDirectionEngaged(i) );
      setThreshold(.75);
   }
   public ControllerStick(Position position,
                   Range xRange, Range yRange)
   {
      super();
      setPosition(position);
      setXRange(xRange);
      setYRange(yRange);
      for(int i = 0; i < getEngagedDirections().length; i++)
         getEngagedDirections()[i] = new ControllerButton(getIsDirectionEngaged(i) );
      setThreshold(.75);
   }
   public ControllerStick(Position position,
                   Range xRange, Range yRange,
                   float threshold)
   {
      super();
      setPosition(position);
      setXRange(xRange);
      setYRange(yRange);
      for(int i = 0; i < getEngagedDirections().length; i++)
         getEngagedDirections()[i] = new ControllerButton(getIsDirectionEngaged(i) );
      setThreshold(threshold);
   }
   protected boolean getIsDirectionEngaged(int index)
   {
      switch(index)
      {
         case DIRECTION_UP:
            return (getPosition().getY() > getYRange().getMiddle() + (getThreshold() * (getYRange().getTotal() / 2) ) );
         case DIRECTION_DOWN:
            return (getPosition().getY() < getYRange().getMiddle() - (getThreshold() * (getYRange().getTotal() / 2) ) );
         case DIRECTION_LEFT:
            return (getPosition().getX() < getXRange().getMiddle() - (getThreshold() * (getXRange().getTotal() / 2) ) );
         case DIRECTION_RIGHT:
            return (getPosition().getX() > getXRange().getMiddle() + (getThreshold() * (getXRange().getTotal() / 2) ) );
         default:
            return false;
      }
   }
   public ControllerStick setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public Range getXRange()
   {
      return xRange;
   }
   public ControllerStick setXRange(Range xRange)
   {
      this.xRange = xRange;
      return this;
   }
   public float mapXStick(float min, float max)
   {
      return map(getPosition().getX(), getXRange().getMin(), getXRange().getMax(), min, max);
   }
   public Range getYRange()
   {
      return yRange;
   }
   public ControllerStick setYRange(Range yRange)
   {
      this.yRange = yRange;
      return this;
   }
   public float mapYStick(float min, float max)
   {
      return map(getPosition().getY(), getYRange().getMin(), getYRange().getMax(), min, max);
   }
   public ControllerButton[] getEngagedDirections()
   {
      return engagedDirections;
   }
   public ControllerStick setEngagedDirections(ControllerButton[] engagedDirections)
   {
      if(engagedDirections.length >= this.engagedDirections.length)
         for(int i = 0; i < this.engagedDirections.length; i++)
            this.engagedDirections[i] = engagedDirections[i];
      return this;
   }
   public float getThreshold()
   {
      return threshold;
   }
   public ControllerStick setThreshold(float threshold)
   {
      if(threshold < 0)
         threshold = 0;
      else if(threshold > 1)
         threshold = 1;
      this.threshold = threshold;
      return this;
   }
   public ControllerStick update(Position position, boolean pressed)
   {
      super.update(pressed);
      setPosition(position);
      engagedDirections[DIRECTION_UP].update(getIsDirectionEngaged(DIRECTION_UP) );
      engagedDirections[DIRECTION_DOWN].update(getIsDirectionEngaged(DIRECTION_DOWN) );
      engagedDirections[DIRECTION_LEFT].update(getIsDirectionEngaged(DIRECTION_LEFT) );
      engagedDirections[DIRECTION_RIGHT].update(getIsDirectionEngaged(DIRECTION_RIGHT) );
      return this;
   }
}
