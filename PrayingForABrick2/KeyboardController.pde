import java.awt.event.KeyListener;
import java.awt.event.KeyEvent;

class KeyboardController extends Controller implements KeyListener, GameConstants, JSONifiable
{
   int[] directionKeys = new int[4];
   int stickClickKey;
   int[] actionKeys = new int[4];
   public KeyboardController()
   {
      super();
      setDefaultKeys();
      setStick(new ControllerStick()
                   .setXRange(new Range(-100, 100) )
                   .setYRange(new Range(-100, 100) )
                   .setPosition(new Position(0, 0) )
              );
      frame.addKeyListener(this);
   }
   protected void setDefaultKeys()
   {
      getDirectionKeys()[DIRECTION_UP] = KeyEvent.VK_KP_UP;
      getDirectionKeys()[DIRECTION_DOWN] = KeyEvent.VK_KP_DOWN;
      getDirectionKeys()[DIRECTION_LEFT] = KeyEvent.VK_KP_LEFT;
      getDirectionKeys()[DIRECTION_RIGHT] = KeyEvent.VK_KP_RIGHT;
      getActionKeys()[DIRECTION_DOWN] = KeyEvent.VK_1;
      getActionKeys()[DIRECTION_RIGHT] = KeyEvent.VK_2;
      getActionKeys()[DIRECTION_LEFT] = KeyEvent.VK_3;
      getActionKeys()[DIRECTION_UP] = KeyEvent.VK_4;
      setStickClickKey(KeyEvent.VK_SPACE);
   }
   public int[] getDirectionKeys()
   {
      return directionKeys;
   }
   public KeyboardController setDirectionKeys(int[] directionKeys)
   {
      this.directionKeys = directionKeys;
      return this;
   }
   public int[] getActionKeys()
   {
      return actionKeys;
   }
   public KeyboardController setActionKeys(int[] actionKeys)
   {
      this.actionKeys = actionKeys;
      return this;
   }
   public int getStickClickKey()
   {
      return stickClickKey;
   }
   public KeyboardController setStickClickKey(int stickClickKey)
   {
      this.stickClickKey = stickClickKey;
      return this;
   }
   public KeyboardController update()
   {
      return this;
   }
   public void keyReleased(java.awt.event.KeyEvent e)
   {
      println(e.getKeyCode() + "asdf");
   }
   public void keyPressed(java.awt.event.KeyEvent e)
   {
      println(e.getKeyCode() + "asdf");
   }
   public void keyTyped(java.awt.event.KeyEvent e)
   {
      println(e.getKeyCode() + "asdf");
   }
   public KeyboardController setStick(ControllerStick stick)
   {
      super.setStick(stick);
      return this;
   }
   public KeyboardController setFaceButtons(ControllerButton[] faceButtons)
   {
      super.setFaceButtons(faceButtons);
      return this;
   }
}
