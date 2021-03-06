class Text implements Drawable, JSONifiable
{
   protected PFont font;
   protected String text;
   protected Position position;
   protected ColorSet myColor;
   public Text()
   {
      setFont(new PFont() );
      setText("");
      setPosition(new Position() );
      setColor(new ColorSet() );
   }
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", "Text");
      obj.setJSONObject("font", fontToJSON(getFont() ) );
      obj.setJSONObject("position", position.toJSON() );
      obj.setJSONObject("color", myColor.toJSON() );
      return obj;
   }
   protected JSONObject fontToJSON(PFont font)
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setString("name", getFont().getName() );
      obj.setInt("size", getFont().getSize() );
      return obj;
   }
   protected PFont fontFromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
      return new PFont();
   }
   public void fromJSON(JSONObject obj)
   {
      
   }
   public PFont getFont()
   {
      return font;
   }
   public Text setFont(PFont font)
   {
      this.font = font;
      return this;
   }
   public String getText()
   {
      return text;
   }
   public Text setText(String text)
   {
      this.text = text;
      return this;
   }
   public ColorSet getColor()
   {
      return myColor;
   }
   public Text setColor(ColorSet myColor)
   {
      this.myColor = myColor;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public Text setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public Text draw()
   {
      textFont(getFont() );
      myColor.draw();
      text(getText(), getPosition().getX(), getPosition().getY() );
      return this;
   }
}
