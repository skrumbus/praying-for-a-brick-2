class Size implements JSONifiable
{
   protected float w, h;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setFloat("width", getWidth() );
      obj.setFloat("height", getHeight() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("width") )
            setWidth(obj.getFloat("width") );
         else
            setWidth(0);
         if(!obj.isNull("height") )
            setHeight(obj.getFloat("height") );
         else
            setHeight(0);
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Size()
   {
      setWidth(0);
      setHeight(0);
   }
   public Size(float w, float h)
   {
      setWidth(w);
      setHeight(h);
   }
   public float getWidth()
   {
      return w;
   }
   public Size setWidth(float w)
   {
      this.w = w;
      return this;
   }
   public float getHeight()
   {
      return h;
   }
   public Size setHeight(float h)
   {
      this.h = h;
      return this;
   }
   public Float getArea()
   {
      return (getHeight() * getWidth() );
   }
   public Float getPerimeter()
   {
      return 2 * (getHeight() + getWidth() );
   }
}
