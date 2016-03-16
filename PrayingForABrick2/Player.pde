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
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("doDrawHud") )
            setDoDrawHud(obj.getBoolean("doDrawHud") );
         else
            setDoDrawHud(true);
         if(!obj.isNull("paddle") )
         {
            Paddle p = new Paddle();
            p.fromJSON(obj.getJSONObject("paddle") );
            setPaddle(p);
         }
         else
            setPaddle(new Paddle() );
         if(!obj.isNull("hud") )
         {
            Hud h = new Hud();
            h.fromJSON(obj.getJSONObject("hud") );
            setHud(h);
         }
         else
            setHud(new Hud() );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
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
   protected void lockDeltas()
   {
      if(getIsXLocked() )
         getPaddle().getPosition().setDeltaX(0);
      if(getIsYLocked() )
         getPaddle().getPosition().setDeltaY(0);
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
