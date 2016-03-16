class ControllerButton implements JSONifiable
{
   protected boolean isTapped;
   protected boolean isHeld;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setBoolean("isTapped", getIsTapped() );
      obj.setBoolean("isHeld", getIsHeld() );
      return obj;
   }
   protected boolean checkAndReturn(JSONObject obj, String name, boolean def)
   {
      if(!obj.isNull(name) )
         return obj.getBoolean(name);
      else
         return def;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         setIsTapped(checkAndReturn(obj, "isTapped", false) );
         setIsHeld(checkAndReturn(obj, "isHeld", false) );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public ControllerButton()
   {
      setIsTapped(false);
      setIsHeld(false);
   }
   public ControllerButton(boolean isTapped, boolean isHeld)
   {
      setIsTapped(isTapped);
      setIsHeld(isHeld);
   }
   public ControllerButton(boolean pressed)
   {
      setIsTapped(pressed);
      setIsHeld(pressed);
   }
   public boolean getIsHeld()
   {
      return isHeld;
   }
   public void setIsHeld(boolean isHeld)
   {
      this.isHeld = isHeld;
   }
   public boolean getIsTapped()
   {
      return isTapped;
   }
   public void setIsTapped(boolean isTapped)
   {
      this.isTapped = isTapped;
   }
   public void update(boolean pressed)
   {
      isTapped = (!getIsHeld() && pressed);
      setIsHeld(pressed);
   }
}
