class ControllerStick extends ControllerButton
{
   protected Position position;
   protected Range xRange, yRange;
   protected ControllerButton[] engagedDirections = new ControllerButton[4];
   protected float threshold;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", "ControllerStick");
      obj.setJSONObject("stick", new JSONObject() );
      obj.setJSONObject("position", position.toJSON() );
      obj.setJSONObject("xRange", xRange.toJSON() );
      obj.setJSONObject("yRange", yRange.toJSON() );
      obj.setJSONArray("engagedDirections", new JSONArray() );
      for(int i = 0; i < engagedDirections.length; i++)
         obj.getJSONArray("engagedDirections").setJSONObject(i, engagedDirections[i].toJSON() );
      return obj;
   }
   public ControllerStick()
   {
      super();
      setPosition(new Position(0, 0) );
      setXRange(new Range(0, 0) );
      setYRange(new Range(0, 0) );
      for(int i = 0; i < engagedDirections.length; i++)
         setEngagedDirection(new ControllerButton(getIsDirectionEngaged(i) ), i);
      setThreshold(0);
   }
   public ControllerStick(Position position,
                   Range xRange, Range yRange)
   {
      super();
      setPosition(position);
      setXRange(xRange);
      setYRange(yRange);
      for(int i = 0; i < engagedDirections.length; i++)
         setEngagedDirection(new ControllerButton(getIsDirectionEngaged(i) ), i);
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
      for(int i = 0; i < engagedDirections.length; i++)
         setEngagedDirection(new ControllerButton(getIsDirectionEngaged(i) ), i);
      setThreshold(threshold);
   }
   protected boolean getIsDirectionEngaged(int index)
   {
      switch(index)
      {
         case RECT_TOP:
            return ( (getPosition().getY() > getYRange().getMiddle() + (getThreshold() * getYRange().getTotal() ) && (getYRange().getMax() > getYRange().getMin() ) ) ||
                     (getPosition().getY() < getYRange().getMiddle() + (getThreshold() * getYRange().getTotal() ) && (getYRange().getMax() < getYRange().getMin() ) ) );
         case RECT_BOTTOM:
            return ( (getPosition().getY() < getYRange().getMiddle() + (getThreshold() * getYRange().getTotal() ) && (getYRange().getMin() < getYRange().getMax() ) ) ||
                     (getPosition().getY() > getYRange().getMiddle() + (getThreshold() * getYRange().getTotal() ) && (getYRange().getMin() > getYRange().getMax() ) ) );
         case RECT_LEFT:
            return ( (getPosition().getX() < getXRange().getMiddle() + (getThreshold() * getXRange().getTotal() ) && (getXRange().getMin() < getXRange().getMax() ) ) ||
                     (getPosition().getX() > getXRange().getMiddle() + (getThreshold() * getXRange().getTotal() ) && (getXRange().getMin() > getXRange().getMax() ) ) );
         case RECT_RIGHT:
            return ( (getPosition().getX() > getXRange().getMiddle() + (getThreshold() * getXRange().getTotal() ) && (getXRange().getMax() > getXRange().getMin() ) ) ||
                     (getPosition().getX() < getXRange().getMiddle() + (getThreshold() * getXRange().getTotal() ) && (getXRange().getMax() < getXRange().getMin() ) ) );
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
   public ControllerButton getEngagedDirection(int index)
   {
      if(index < 0 || index >= engagedDirections.length)
         return null;
      else
         return engagedDirections[index];
   }
   public ControllerStick setEngagedDirection(ControllerButton engaged, int index)
   {
      if(index >= 0 && index < this.engagedDirections.length)
         this.engagedDirections[index] = engaged;
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
      for(int i = 0; i < engagedDirections.length; i++)
         engagedDirections[i].update(pressed);
      return this;
   }
}
