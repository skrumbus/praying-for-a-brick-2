class HumanPlayer extends Player implements JSONifiable
{
   protected Controller controller;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("controller", controller.toJSON() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         obj.setString("this", super.getClass().getSimpleName() );
         super.fromJSON(obj);
         if(!obj.isNull("controller") )
         {
            if(!obj.getJSONObject("controller").isNull("this") )
            {
               if(obj.getJSONObject("controller").getString("this").equals("KeyboardController") )
               {
                  KeyboardController k = new KeyboardController();
               }
               else if(obj.getJSONObject("controller").getString("this").equals("JoyStickController") )
               {
                  JoyStickController j = new JoyStickController();
                  j.fromJSON(obj.getJSONObject("controller") );
                  setController(j);
               }
               else
               {
                  setController(null);
               }
            }
         }
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Controller getController()
   {
      return controller;
   }
   public HumanPlayer setController(Controller controller)
   {
      this.controller = controller;
      return this;
   }
   public HumanPlayer setPaddle(Paddle paddle)
   {
      super.setPaddle(paddle);
      return this;
   }
   public HumanPlayer setDoDrawHud(boolean doDrawHud)
   {
      super.setDoDrawHud(doDrawHud);
      return this;
   }
   public HumanPlayer setHud(Hud hud)
   {
      super.setHud(hud);
      return this;
   }
   public HumanPlayer setIsXLocked(boolean isXLocked)
   {
      super.setIsXLocked(isXLocked);
      return this;
   }
   public HumanPlayer setIsYLocked(boolean isYLocked)
   {
      super.setIsYLocked(isYLocked);
      return this;
   }
   protected float getPaddleIncrement(boolean isX)
   {
      if (isX)
         return map(getController().getStick().getPosition().getX(),
                    getController().getStick().getXRange().getMin(),
                    getController().getStick().getXRange().getMax(),
                    getPaddle().getPosition().getSpeedRange().getMax() * -1, 
                    getPaddle().getPosition().getSpeedRange().getMax() );
      else
      {
         return map(getController().getStick().getPosition().getY(),
                    getController().getStick().getYRange().getMax(),
                    getController().getStick().getYRange().getMin(),
                    getPaddle().getPosition().getSpeedRange().getMax() * -1, 
                    getPaddle().getPosition().getSpeedRange().getMax() );
      }
   }
   public HumanPlayer update()
   {
      int xIncrement;
      int yIncrement;
      controller.update();
      xIncrement = (int) getPaddleIncrement(true);
      yIncrement = (int) getPaddleIncrement(false);
      getPaddle().getPosition().setDeltas(xIncrement, yIncrement);
      lockDeltas();
      //getPaddle().getPosition().setX(getPaddle().getPosition().getX() + getPaddle().getPosition().getDeltaX() );
      //getPaddle().getPosition().setY(getPaddle().getPosition().getY() + getPaddle().getPosition().getDeltaY() );
      return this;
   }
   
}
