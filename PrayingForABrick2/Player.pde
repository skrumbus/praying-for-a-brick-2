import java.util.Vector;

abstract class Player
{
   protected Paddle paddle;
   protected Hud hud;
   protected boolean doDrawHud;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("paddle", getPaddle().toJSON() );
      obj.setBoolean("doDrawHud", getDoDrawHud() );
      obj.setJSONObject("hud", hud.toJSON() );
      return obj;
   }
   public Player(Paddle paddle,
                 Hud hud,
                 boolean doDrawHud)
   {
      setPaddle(paddle);
      setHud(hud);
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
   public Hud getHud()
   {
      return hud;
   }
   public Player setHud(Hud hud)
   {
      this.hud = hud;
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
