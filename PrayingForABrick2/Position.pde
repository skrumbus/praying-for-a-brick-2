class Position implements JSONifiable
{
   protected float x, y;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setFloat("x", getX() );
      obj.setFloat("y", getY() );
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
         setX(checkAndReturn(obj, "x", 0) );
         setY(checkAndReturn(obj, "y", 0) );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Position()
   {
      setX(0);
      setY(0);
   }
   public Position(float x, float y)
   {
      setX(x);
      setY(y);
   }
   public float getX()
   {
      return x;
   }
   public Position setX(float x)
   {
      this.x = x;
      return this;
   }
   public float getY()
   {
      return y;
   }
   public Position setY(float y)
   {
      this.y = y;
      return this;
   }
}
