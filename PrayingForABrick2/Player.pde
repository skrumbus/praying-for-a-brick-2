import java.util.Vector;

abstract class Player implements JSONifiable
{
   protected Paddle paddle;
   protected Hud hud;
   protected boolean doDrawHud;
   boolean isYLocked, isXLocked;
   public Player()
   {
      setPaddle(new Paddle() );
      setHud(new Hud() );
      setDoDrawHud(true);
   }
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("paddle", getPaddle().toJSON() );
      obj.setBoolean("doDrawHud", getDoDrawHud() );
      obj.setJSONObject("hud", hud.toJSON() );
      return obj;
   }
   public Player fromJSON(JSONObject obj)
   {
      return this;
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
   public boolean getIsYLocked()
   {
      return isYLocked;
   }
   public Player setIsYLocked(boolean isYLocked)
   {
      this.isYLocked = isYLocked;
      return this;
   }
   public boolean getIsXLocked()
   {
      return isXLocked;
   }
   public Player setIsXLocked(boolean isXLocked)
   {
      this.isXLocked = isXLocked;
      return this;
   }
   public abstract Player update();
   public Player draw()
   {
      //getHud().update(this);
      //if(getDoDrawHud() )
      //   hud.draw();
      getPaddle().draw();
      return this;
   }
}