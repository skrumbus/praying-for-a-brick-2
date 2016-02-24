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
   public Position fromJSON(JSONObject obj)
   {
      return this;
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