import java.util.Vector;

class Menu implements Drawable, JSONifiable
{
   protected Vector<MenuItem> items;
   protected ColorSet myColor;
   protected Position position;
   protected Size size;
   protected Text title;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("color", getColor().toJSON() );
      obj.setJSONObject("position", getPosition().toJSON() );
      obj.setJSONObject("size", getSize().toJSON() );
      obj.setJSONObject("title", getTitle().toJSON() );
      obj.setJSONArray("items", new JSONArray() );
      for(int i = 0; i < getItems().size(); i++)
         obj.getJSONArray("items").setJSONObject(i,  getItems().elementAt(i).toJSON() );
      return obj;
   }
   public Menu fromJSON(JSONObject obj)
   {
      return this;
   }
   public Vector<MenuItem> getItems()
   {
      return items;
   }
   public ColorSet getColor()
   {
      return myColor;
   }
   public Menu setColor(ColorSet myColor)
   {
      this.myColor = myColor;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public Menu setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public Size getSize()
   {
      return size;
   }
   public Menu setSize(Size size)
   {
      this.size = size;
      return this;
   }
   public Text getTitle()
   {
      return title;
   }
   public Menu setTitle(Text title)
   {
      this.title = title;
      return this;
   }
   public Menu distributePositions(Boolean isVertical)
   {
      //evenly distribute menuItems across menu
      return this;
   }
   public Menu distributePositions() //assuming a vertical menu
   {
      //evenly distribute menuItems across menu
      return this;
   }
   public Menu draw()
   {
      getColor().draw();
      rect(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
      getTitle().draw();
      for(MenuItem item : getItems() )
         item.draw();
      return this;
   }
}