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
   public ControllerButton fromJSON(JSONObject obj)
   {
      return this;
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