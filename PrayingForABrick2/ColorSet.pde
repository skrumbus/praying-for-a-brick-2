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
   public ColorSet fromJSON(JSONObject obj)
   {
      return this;
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
      stroke(stroke);
      fill(primary);
      return this;
   }
}