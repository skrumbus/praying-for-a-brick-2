import java.util.Vector;

class PlayerGroup implements JSONifiable
{
   protected Vector<Ball> balls = new Vector<Ball>();
   protected Vector<Integer> holdingBalls = new Vector<Integer>();
   protected Vector<Player> players = new Vector<Player>();
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONArray("balls", new JSONArray() );
      obj.setJSONArray("holdingBalls", new JSONArray() );
      obj.setJSONArray("players", new JSONArray() );
      for(int i = 0; i < getBalls().size(); i++)
         obj.getJSONArray("balls").setJSONObject(i, getBalls().elementAt(i).toJSON() );
      for(int i = 0; i < getHoldingBalls().size(); i++)
         obj.getJSONArray("holdingBalls").setInt(i, getHoldingBalls().elementAt(i) );
      for(int i = 0; i < getPlayers().size(); i++)
         obj.getJSONArray("players").setJSONObject(i, getPlayers().elementAt(i).toJSON() );
      return obj;
   }
   public PlayerGroup fromJSON(JSONObject obj)
   {
      return this;
   }
   public Vector<Player> getPlayers()
   {
      return players;
   }
   public Vector<Ball> getBalls()
   {
      return balls;
   }
   public Vector<Integer> getHoldingBalls()
   {
      return holdingBalls;
   }
   public PlayerGroup draw()
   {
      for(int i = 0; i < balls.size(); i++)
         getBalls().elementAt(i).draw();
      for(int i = 0; i < players.size(); i ++)
         getPlayers().elementAt(i).draw();
      return this;
   }
}