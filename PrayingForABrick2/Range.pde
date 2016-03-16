class Range implements JSONifiable
{
   protected float min, max;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setFloat("min", getMin() );
      obj.setFloat("max", getMax() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("min") )
            setMin(obj.getFloat("min") );
         else
            setMin(0);
         if(!obj.isNull("max") )
            setMax(obj.getFloat("max") );
         else
            setMax(0);
         if(getMin() > getMax() )
         {
            float swap = getMin();
            setMin(getMax() );
            setMax(swap);
         }
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Range()
   {
      setRange(0, 0);
   }
   public Range(float min, float max)
   {
      setRange(min, max);
   }
   public float getMin()
   {
      return min;
   }
   protected Range setMin(float min)
   {
      this.min = min;
      return this;
   }
   public float getMax()
   {
      return max;
   }
   protected Range setMax(float max)
   {
      this.max = max;
      return this;
   }
   public Range setRange(float min, float max)
   {
      if(min > max)
      {
         float swap = min;
         min = max;
         max = swap;
      }
      setMin(min);
      setMax(max);
      return this;
   }
   public float getTotal()
   {
      return max - min;
   }
   public float getMiddle()
   {
      return (getTotal() / 2) + min;
   }
   public float constrainValue(float i)
   {
      return constrain(i, getMin(), getMax() );
   }
}
