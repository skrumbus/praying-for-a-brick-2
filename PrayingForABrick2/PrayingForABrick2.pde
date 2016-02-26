float maxSpeed = 6;
Vector<Brick> bricks = new Vector<Brick>();
HumanPlayer player;
void setup()
{
   size(600,600);
   BrickGenerator bG = new BrickGenerator().setPosition(new MovingPosition(0,0)
                                                            .setXRange(new Range(0, width) )
                                                            .setYRange(new Range(0, height / 4) ) )
                                           .setSpacing(5)
                                           .setRows(ColorConstants.COLORS_RAINBOW.length)
                                           .setColumns(ColorConstants.COLORS_RAINBOW.length * 2)
                                           .setColors(reverseColorSettify(ColorConstants.COLORS_RAINBOW,
                                                                          ColorConstants.COLORS_RAINBOW.length,
                                                                          ColorConstants.COLORS_RAINBOW.length * 2 ) );
   bricks = bG.standard();
   float pHeight = height / 16;
   float pWidth = width / 4;
   player = new HumanPlayer()
                .setPaddle(new Paddle()
                               .setTop(DirectionConstants.DIRECTION_UP) 
                               .setPosition(new MovingPosition(width / 2 - pWidth / 2, height - pHeight * 1.5)
                                                .setXRange(new Range(0, width) )
                                                .setYRange(new Range(0, height) )
                                                .setSpeedRange(new Range(0, maxSpeed) )
                                                .setSpeed(maxSpeed / 2)
                                                .setDeltas(0, 0)
                                           )
                               .setSize(new Size(pWidth, pHeight) )
                               .setColor(new ColorSet(color(ColorConstants.COLORS_SHADES[1]) ) ) )
                .setHud(new Hud())
                .setIsXLocked(false)
                .setIsYLocked(false);
   println(bricks.size() );
   println(bricks.elementAt(0).toJSON().toString());
   surface.setResizable(true);
}
void draw()
{
   background(0);
   drawBricks(bricks);
   player.draw();
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