import java.awt.event.KeyEvent;

class KeyboardController extends Controller
{
   
   KeyboardController()
   {
      super();
   }
   KeyboardController update()
   {
      return this;
   }
   void keyReleased()
   {
      println(key);
   }
}
