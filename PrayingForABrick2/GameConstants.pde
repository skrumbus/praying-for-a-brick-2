interface GameConstants
{
   public final float BRICK_SPACING = 5;
   public final float BRICK_MINALPHA = .25;
   
   public final float GAME_MAXSPEED = 6;
   
   final color[] COLORS_RAINBOW = 
   {
      #FF6464,
      #FF7F64,
      #FFFF64,
      #64FF64,
      #6464FF,
      #4B6482,
      #8B64FF
   };
   final color[] COLORS_SHADES = 
   {
     #000000,
     #323232,
     #969696,
     #E1E1E1,
     #FFFFFF
   };
   
   public final int DIRECTION_UP = 0;
   public final int DIRECTION_RIGHT = 1;
   public final int DIRECTION_DOWN = 2;
   public final int DIRECTION_LEFT = 3;
   
   final int JOYSTICKCONTROLLER_BAUDRATE = 250000;
   final int JOYSTICKCONTROLLER_RIGHTBUTTON = 3;
   final int JOYSTICKCONTROLLER_UPBUTTON = 4;
   final int JOYSTICKCONTROLLER_DOWNBUTTON = 5;
   final int JOYSTICKCONTROLLER_LEFTBUTTON = 6;
   final int JOYSTICKCONTROLLER_STICKX = 0;
   final int JOYSTICKCONTROLLER_STICKY = 1;
   final int JOYSTICKCONTROLLER_STICKBUTTON = 2;
   final char JOYSTICKCONTROLLER_DELIMITER = ',';
   
   public final int SHAPE_RECT = 1;
   public final int SHAPE_ELLIPSE = 2;
   
   public final int POWERUP_CATCH = 1;
   public final int POWERUP_INVINCIBILITY = 2;
   public final int POWERUP_WIDEPADDLE = 3;
   public final int POWERUP_SLOWBALL = 4;
   public final int POWERUP_FASTPADDLE = 5;
   public final int POWERUP_LASER = 6;
   public final int POWERUP_LINEBREAK = 7;
   public final int POWERUP_DOUBLE = 8;
   public final int POWERUP_STRONGBALL = 9;
   public final int POWERUP_LASERSHIELD = 10;
   
   public final int POWERDOWN_SHORTPADDLE = -1;
   public final int POWERDOWN_SLOWPADDLE = -2;
   public final int POWERDOWN_FASTBALL = -3;
   public final int POWERDOWN_WEAKBALL = -4;

   public final int POWERUPSTATE_FREE = 1;
   public final int POWERUPSTATE_AVAILABLE = 2;
   public final int POWERUPSTATE_ACTIVE = 3;
}
