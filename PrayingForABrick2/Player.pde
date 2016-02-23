import java.util.Vector;

abstract class Player
{
   protected Paddle paddle;
   //protected Hud hud;
   protected boolean doDrawHud;
   protected void updateHud()
   {
      //hud.update(this);
   }
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", "Player");
      obj.setJSONObject("paddle", getPaddle().toJSON() );
      obj.setBoolean("doDrawHud", getDoDrawHud() );
      return obj;
   }
   public Player(Paddle paddle,
                 boolean doDrawHud)
   {
      setPaddle(paddle);
      setDoDrawHud(doDrawHud);
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
   public Player draw()
   {
      //getHud().update(this);
      //if(getDoDrawHud() )
      //   hud.draw();
      getPaddle().draw();
      return this;
   }
}
