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
   public HumanPlayer fromJSON(JSONObject obj)
   {
      return this;
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
         return map(getController().getStick().getPosition().getY(),
                    getController().getStick().getXRange().getMin(),
                    getController().getStick().getXRange().getMax(),
                    getPaddle().getPosition().getSpeed() * -1, 
                    getPaddle().getPosition().getSpeed() );
      else
         return map(getController().getStick().getPosition().getY(),
                    getController().getStick().getYRange().getMin(),
                    getController().getStick().getYRange().getMax(),
                    getPaddle().getPosition().getSpeed() * -1, 
                    getPaddle().getPosition().getSpeed() );
   }
   protected float getAppropriateSpeed(float xIncrement, float yIncrement)
   {
      return sqrt(pow(xIncrement, 2) + pow(yIncrement, 2));
   }
   public HumanPlayer update()
   {
      float xIncrement;
      float yIncrement;
      controller.update();
      if(isXLocked)
         xIncrement = 0;
      else
         xIncrement = getPaddleIncrement(true);
      if(isYLocked)
         yIncrement = 0;
      else
         yIncrement = getPaddleIncrement(false);
      getPaddle().getPosition().setSpeed(getAppropriateSpeed(xIncrement, yIncrement) ).setDeltas(xIncrement, yIncrement);
      return this;
   }
   
}