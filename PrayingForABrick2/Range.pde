class Range
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
   public Range()
   {
      setRange(Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY);
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
