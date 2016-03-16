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
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         ControllerStick s = new ControllerStick();
         if(!obj.isNull("faceButtons") )
            for(int i = 0; i < getFaceButtons().length; i++)
            {
               ControllerButton b = new ControllerButton();
               b.fromJSON(obj.getJSONArray("faceButtons").getJSONObject(i) );
               getFaceButtons()[i] = b;
            }
         else
            for(int i = 0; i < getFaceButtons().length; i++)
               getFaceButtons()[i] = new ControllerButton();
         if(!obj.isNull("stick") )
            s.fromJSON(obj.getJSONObject("stick") );
         setStick(s);
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class.");
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
