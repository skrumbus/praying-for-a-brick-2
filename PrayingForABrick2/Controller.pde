abstract class Controller
{
   protected ControllerStick stick;
   protected ControllerButton[] faceButtons = new ControllerButton[4];
   public ControllerStick getStick()
   {
      return stick;
   }
   public void setStick(ControllerStick stick)
   {
      this.stick = stick;
   }
   public ControllerButton[] getFaceButtons()
   {
      return faceButtons;
   }
   public void setFaceButtons(ControllerButton[] faceButtons)
   {
      if(faceButtons.length >= this.faceButtons.length)
         for(int i = 0; i < this.faceButtons.length; i++)
            this.faceButtons[i] = faceButtons[i];
   }
   public ControllerButton getFaceButton(int i)
   {
      if(i >= 0 && i < faceButtons.length)
         return faceButtons[i];
      else
         return null;
   }
   public void setControllerButton(ControllerButton faceButton, int i)
   {
      if(i >= 0 && i < faceButtons.length)
         faceButtons[i] = faceButton;
   }
   public void update()
   {
      
   }
}
