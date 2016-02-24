

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
                                           .setColumns(COLORS_RAINBOW.length * 2)
                                           .setColors(reverseColorSettify(COLORS_RAINBOW, COLORS_RAINBOW.length, COLORS_RAINBOW.length * 2 ));
   bricks = bG.standard();
   println(bricks.size() );
   println(bricks.elementAt(0).toJSON().toString());
   frame.setResizable(true);
}
void draw()
{
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
ColorSet[][] reverseColorSettify(color[] colors, int rows, int cols)
{
   ColorSet[][] set = new ColorSet[colors.length][];
   for(int i = 0; i < rows; i++)
   {
      set[i] = new ColorSet[cols];
      for(int j = 0; j < cols; j++)
         set[i][j] = new ColorSet()
                      .setPrimary(colors[(i + j) % colors.length]);
   }
   return set;
}
