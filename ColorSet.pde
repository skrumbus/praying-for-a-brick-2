class ColorSet
{
   protected color primary;
   protected color stroke;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", "ColorSet");
      obj.setJSONObject("primary", colorToJSON(primary) );
      obj.setJSONObject("stroke", colorToJSON(stroke) );
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
}