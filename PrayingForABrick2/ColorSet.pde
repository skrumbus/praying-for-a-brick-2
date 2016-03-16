class ColorSet implements Drawable, JSONifiable
{
   protected color primary;
   protected color stroke;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("primary", colorToJSON(getPrimary() ) );
      obj.setJSONObject("stroke", colorToJSON(getStroke() ) );
      return obj;
   }
   protected JSONObject colorToJSON(color c)
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", "color");
      obj.setInt("red", (int) red(c) );
      obj.setInt("green", (int) green(c) );
      obj.setInt("blue", (int) blue(c) );
      obj.setInt("alpha", (int) alpha(c) );
      return obj;
   }
   protected color colorFromJSON(JSONObject obj)
   {
      int red = 0, green = 0, blue = 0, alpha = 0;
      if(!obj.isNull("red") )
         red = obj.getInt("red");
      if(!obj.isNull("green") )
         green = obj.getInt("green");
      if(!obj.isNull("blue") )
         blue = obj.getInt("blue");
      if(!obj.isNull("alpha") )
         alpha = obj.getInt("alpha");
      return color(red, green, blue, alpha);
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("primary") && !obj.getJSONObject("primary").isNull("this") && obj.getJSONObject("primary").getString("this").equals("color") )
            setPrimary(colorFromJSON(obj.getJSONObject("primary") ) );
         else
            setPrimary(color(#000000, 0) );
         if(!obj.isNull("stroke") && !obj.getJSONObject("stroke").isNull("this") && obj.getJSONObject("stroke").getString("this").equals("color") )
            setStroke(colorFromJSON(obj.getJSONObject("stroke") ) );
         else
            setStroke(color(#000000, 0) );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class.");
   }
   public ColorSet()
   {
      setPrimary(color(#000000, 0) );
      setStroke(color(#000000, 0) );
   }
   public ColorSet(color primary, color stroke)
   {
      setPrimary(primary);
      setStroke(stroke);
   }
   public ColorSet(color primary)
   {
      setPrimary(primary);
      setStroke(color(#000000, 0));
   }
   public color getPrimary()
   {
      return primary;
   }
   public ColorSet setPrimary(color primary)
   {
      this.primary = primary;
      return this;
   }
   public color getStroke()
   {
      return stroke;
   }
   public ColorSet setStroke(color stroke)
   {
      this.stroke = stroke;
      return this;
   }
   public ColorSet draw()
   {
      if(alpha(getStroke() ) == 0)
         noStroke();
      else
         stroke(getStroke() );
      if(alpha(getPrimary() ) == 0)
         noFill();
      else
         fill(getPrimary() );
      return this;
   }
}
