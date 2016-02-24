import java.util.Vector;

class Fight implements Drawable, JSONifiable
{
   public final int FIGHTTYPE_STANDARD = 1;
   
   protected Vector<PlayerGroup> teams = new Vector<PlayerGroup>();
   protected int fightType;
   protected color bgColor;
   protected Vector<Brick> bricks = new Vector<Brick>();
   protected Size size;
   protected Position position;
   protected Vector<PowerUp> powerUps = new Vector<PowerUp>();
   protected Menu pauseMenu;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setInt("fightType", getFightType() );
      obj.setInt("bgColor", getBackgroundColor() );
      obj.setJSONObject("size", getSize().toJSON() );
      obj.setJSONObject("position", getPosition().toJSON() );
      obj.setJSONObject("pauseMenu", getPauseMenu().toJSON() );
      obj.setJSONArray("teams", new JSONArray() );
      obj.setJSONArray("bricks", new JSONArray() );
      obj.setJSONArray("powerUps", new JSONArray() );
      for(int i = 0; i < getTeams().size(); i++)
         obj.getJSONArray("teams").setJSONObject(i, getTeams().elementAt(i).toJSON() );
      for(int i = 0; i < getBricks().size(); i++)
         obj.getJSONArray("bricks").setJSONObject(i, getBricks().elementAt(i).toJSON() );
      for(int i = 0; i < getPowerUps().size(); i++)
         obj.getJSONArray("powerUps").setJSONObject(i, getPowerUps().elementAt(i).toJSON() );
      return obj;
   }
   public Fight fromJSON(JSONObject obj)
   {
      return this;
   }
   public Fight(int fightType, BrickGenerator gen)
   {
      setPosition(new Position(0, 0) );
      setSize(new Size(width, height) );
      setBackgroundColor(color(#000000, 255) );
      setFightType(fightType);
      setupBricks(gen);
   }
   protected void setupBricks(BrickGenerator gen)
   {
      BrickGenerator bG = new BrickGenerator();
      switch(fightType)
      {
         case FIGHTTYPE_STANDARD:
            bricks = bG.standard();
            break;
      }
   }
   protected float getCenterX()
   {
      return (getPosition().getX() + getSize().getWidth() ) / 2 + getPosition().getX();
   }
   protected float getCenterY()
   {
      return (getPosition().getY() + getSize().getHeight() ) / 2 + getPosition().getY();
   }
   public Vector<PlayerGroup> getTeams()
   {
      return teams;
   }
   public Vector<Brick> getBricks()
   {
     return bricks;
   }
   public Vector<PowerUp> getPowerUps()
   {
     return powerUps;
   }
   public Size getSize()
   {
      return size;
   }
   public Fight setSize(Size size)
   {
      this.size = size;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public Fight setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public color getBackgroundColor()
   {
      return bgColor;
   }
   public Fight setBackgroundColor(color bgColor)
   {
      this.bgColor = bgColor;
      return this;
   }
   public int getFightType()
   {
      return fightType;
   }
   public Fight setFightType(int fightType)
   {
      this.fightType = fightType;
      return this;
   }
   public Menu getPauseMenu()
   {
      return pauseMenu;
   }
   public Fight setPauseMenu(Menu pauseMenu)
   {
      this.pauseMenu = pauseMenu;
      return this;
   }
   public Fight draw()
   {
      fill(getBackgroundColor() );
      rect(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
      for(Brick brick : getBricks() )
         brick.draw();
      for(PlayerGroup team : getTeams() )
         team.draw();
      for(PowerUp powerUp : getPowerUps() )
         powerUp.draw();
      getPauseMenu().draw();
      return this;
   }
}