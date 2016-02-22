import java.util.Vector;

class Player
{
   protected Paddle paddle;
   //protected Hud hud;
   protected Health health;
   protected boolean doDrawHud;
   protected Vector<PowerUp> powerUps;
   protected int score;
   protected int streak;
   protected void updateHud()
   {
      //hud.update(this);
   }
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", "Player");
      obj.setJSONObject("paddle", getPaddle().toJSON() );
      obj.setJSONObject("health", getHealth().toJSON() );
      obj.setBoolean("doDrawHud", getDoDrawHud() );
      obj.setJSONArray("powerUps", new JSONArray() );
      for(int i = 0; i < powerUps.size(); i++)
         obj.getJSONArray("powerUps").setJSONObject(i, getPowerUps().elementAt(i).toJSON() );
      return obj;
   }
   public Player(Paddle paddle,
                 Health health,
                 boolean doDrawHud,
                 Vector<PowerUp> powerUps,
                 int score, int streak)
   {
      setPaddle(paddle);
      setHealth(health);
      setDoDrawHud(doDrawHud);
      setPowerUps(powerUps);
      setScore(score);
      setStreak(streak);
   }
   public Player(Paddle paddle,
                 Health health,
                 boolean doDrawHud)
   {
      setPaddle(paddle);
      setHealth(health);
      setDoDrawHud(doDrawHud);
      setPowerUps(new Vector<PowerUp>() );
   }
   public int getScore()
   {
      return score;
   }
   public Player setScore(int score)
   {
      this.score = score;
      return this;
   }
   public int getStreak()
   {
      return streak;
   }
   public Player setStreak(int streak)
   {
      this.streak = streak;
      return this;
   }
   public Health getHealth()
   {
      return health;
   }
   public Player setHealth(Health health)
   {
      this.health = health;
      return this;
   }
   public Paddle getPaddle()
   {
      return paddle;
   }
   public Player setPaddle(Paddle paddle)
   {
      this.paddle = paddle;
      return this;
   }
   public boolean getDoDrawHud()
   {
      return doDrawHud;
   }
   public Player setDoDrawHud(boolean doDrawHud)
   {
      this.doDrawHud = doDrawHud;
      return this;
   }
   public Vector<PowerUp> getPowerUps()
   {
      return powerUps;
   }
   public Player setPowerUps(Vector<PowerUp> powerUps)
   {
      this.powerUps = powerUps;
      return this;
   }
   public PowerUp getPowerUp(int index)
   {
      if(index < 0 || index >= powerUps.size() )
         return null;
      else
         return getPowerUps().elementAt(index);
   }
}