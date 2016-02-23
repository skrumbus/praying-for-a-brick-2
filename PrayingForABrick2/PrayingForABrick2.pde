final int RECT_TOP = 0;
final int RECT_RIGHT = 1;
final int RECT_BOTTOM = 2;
final int RECT_LEFT = 3;

final int OBJECT_RECT = 1;
final int OBJECT_ELLIPSE = 2;

final int POWERUP_CATCH = 1;
final int POWERUP_INVINCIBILITY = 2;
final int POWERUP_WIDE = 3;
final int POWERUP_SLOW = 4;
final int POWERUP_FAST = 5;
final int POWERUP_LASER = 6;
final int POWERUP_LINE = 7;
final int POWERUP_DOUBLE = 8;
final int POWERUP_STRONGBALL = 9;
final int POWERUP_LASERSHIELD = 10;

final int POWERDOWN_SHORT = -1;
final int POWERDOWN_SLOW = -2;
final int POWERDOWN_FAST = -3;
final int POWERDOWN_WEAKBALL = -4;

final int POWERUPSTATE_FREE = 1;
final int POWERUPSTATE_AVAILABLE = 2;
final int POWERUPSTATE_ACTIVE = 3;

final float BRICK_MINALPHA = .25;

final int FIGHTTYPE_STANDARD = 1;

final float BRICK_SPACING = 5;

final color[] COLORS_RAINBOW = {
  #FF6464,
  #FF7F64,
  #FFFF64,
  #64FF64,
  #6464FF,
  #4B6482,
  #8B64FF
};
final color[] shades = {};
boolean doDraw = false;
Vector<Brick> bricks = new Vector<Brick>();
void setup()
{
   size(600,600);
   BrickGenerator bG = new BrickGenerator().setPosition(new MovingPosition(0,0)
                                                            .setXRange(new Range(0, width) )
                                                            .setYRange(new Range(0, height / 4) ) )
                                           .setSpacing(5)
                                           .setRows(COLORS_RAINBOW.length)
                                           .setColumns(10)
                                           .setColors(reverseColorSettify(COLORS_RAINBOW) );
   bricks = bG.standard();
   println(bricks.size() );
   println(bricks.elementAt(0).toJSON().toString());
}
void draw()
{
   size(600,600);
   background(0);
   drawBricks(bricks);
}
void drawBricks(Vector<Brick> bricks)
{
   for(int i = 0; i < bricks.size(); i++)
      bricks.elementAt(i).draw();
}
int[][] TwoDeeifyIntegerArray(int[] ints, int l)
{
   int[][] newInts = new int[ints.length][];
   for(int i = 0; i < newInts.length; i++)
   {
      newInts[i] = new int[l];
      for(int j = 0; j < newInts[i].length; j++)
         newInts[i][j] = ints[i];
   }
   return newInts;
}
ColorSet[][] reverseColorSettify(color[] colors)
{
   ColorSet[][] set = new ColorSet[colors.length][];
   for(int i = 0; i < set.length; i++)
   {
      set[i] = new ColorSet[colors.length];
      for(int j = 0; j < set[i].length; j++)
         set[i][j] = new ColorSet()
                      .setPrimary(colors[i])
                      .setStroke(colors[(i + j) % colors.length]);
   }
   return set;
}
