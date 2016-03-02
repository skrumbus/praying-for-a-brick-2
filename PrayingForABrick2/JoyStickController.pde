import processing.serial.*;

class JoyStickController extends Controller implements GameConstants
{
   private Serial port;
   public JoyStickController()
   {
      super();
      port = null;
   }
   public Serial getPort()
   {
      return port;
   }
   public JoyStickController setPort(Serial port)
   {
      this.port = port;
      return this;
   }
   protected int[] getControllerState()
   {
      int[] state = new int[0];
      if(getPort().available() > 0)
      {
         String input = getPort().readStringUntil('\n');
         if(input != null)
            state = int(split(input, JOYSTICKCONTROLLER_DELIMITER) );
      }
      return state;
   }
   public JoyStickController setStick(ControllerStick stick)
   {
      super.setStick(stick);
      return this;
   }
   public JoyStickController setFaceButtons(ControllerButton[] faceButtons)
   {
      super.setFaceButtons(faceButtons);
      return this;
   }
   public JoyStickController update()
   {
      int[] state = getControllerState();
      if(state.length >= 7)
      {
         getStick().update(new Position(state[JOYSTICKCONTROLLER_STICKX], state[JOYSTICKCONTROLLER_STICKY]), state[JOYSTICKCONTROLLER_STICKBUTTON] == 0);
         getFaceButtons()[DIRECTION_UP].update(state[JOYSTICKCONTROLLER_UPBUTTON] == 0);
         getFaceButtons()[DIRECTION_DOWN].update(state[JOYSTICKCONTROLLER_DOWNBUTTON] == 0);
         getFaceButtons()[DIRECTION_RIGHT].update(state[JOYSTICKCONTROLLER_RIGHTBUTTON] == 0);
         getFaceButtons()[DIRECTION_LEFT].update(state[JOYSTICKCONTROLLER_LEFTBUTTON] == 0);
      }
      else
         for(int i = 0; i < getFaceButtons().length; i++)
            getFaceButtons()[i].setIsTapped(false);
      return this;
   }
}
