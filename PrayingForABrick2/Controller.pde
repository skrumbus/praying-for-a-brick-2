abstract class Controller implements JSONifiable
{
   protected ControllerStick stick;
   protected ControllerButton[] faceButtons = new ControllerButton[4];
   public Controller()
   {
      setStick(new ControllerStick() );
      for(int i = 0; i < getFaceButtons().length; i++)
         getFaceButtons()[i] = new ControllerButton();
   }
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("stick", getStick().toJSON() );
      obj.setJSONArray("faceButtons", new JSONArray() );
      for(int i = 0; i < faceButtons.length; i++)
         obj.getJSONArray("faceButtons").setJSONObject(i, getFaceButtons()[i].toJSON() );
      return obj;
   }
   public Controller fromJSON(JSONObject obj)
   {
      return this;
   }
   public ControllerStick getStick()
   {
      return stick;
   }
   public Controller setStick(ControllerStick stick)
   {
      this.stick = stick;
      return this;
   }
   public ControllerButton[] getFaceButtons()
   {
      return faceButtons;
   }
   public Controller setFaceButtons(ControllerButton[] faceButtons)
   {
      if(faceButtons.length >= this.faceButtons.length)
         for(int i = 0; i < this.faceButtons.length; i++)
            this.faceButtons[i] = faceButtons[i];
      return this;
   }
   public abstract Controller update();
}