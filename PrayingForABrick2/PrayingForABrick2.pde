
Vector<Brick> bricks = new Vector<Brick>();
HumanPlayer player;
Physics physics = new Physics();
void setup()
{
   size(600, 600);
   /*BrickGenerator bG = new BrickGenerator().setPosition(new MovingPosition(0, 0)
      .setXRange(new Range(0, width) )
      .setYRange(new Range(0, height / 4) ) )
      .setSpacing(5)
         .setRows(GameConstants.COLORS_RAINBOW.length)
            .setColumns(GameConstants.COLORS_RAINBOW.length * 2)
               .setColors(reverseColorSettify(GameConstants.COLORS_RAINBOW, 
               GameConstants.COLORS_RAINBOW.length, 
               GameConstants.COLORS_RAINBOW.length * 2 ) );*/
   BrickGenerator bG = new BrickGenerator();
   bG.fromJSON(loadJSONObject("data/defaults/brickGenerator.json") );
   bricks = bG.standard();
   float pHeight = height / 32;
   float pWidth = width / 6;
   player = new HumanPlayer()
      .setPaddle(new Paddle()
         .setTop(GameConstants.DIRECTION_UP) 
         .setPosition(new MovingPosition(width / 2 - pWidth / 2, height - pHeight * 1.5)
         .setXRange(new Range(0, width - pWidth) )
         .setYRange(new Range(0, height - pHeight) )
         .setSpeedRange(new Range(0, GameConstants.GAME_MAXSPEED) )
         .setDeltas(0, 0)
         )
         .setSize(new Size(pWidth, pHeight) )
         .setColor(new ColorSet(color(#ff0000, 160) ) )
      )
      .setHud(new Hud())
      .setIsXLocked(false)
      .setIsYLocked(false)
      .setController(new JoyStickController()
         .setStick(new ControllerStick()
            .setXRange(new Range(0, 1023) )
            .setYRange(new Range(0, 1023) )
            .setThreshold(.75)
            .setPosition(new Position(511, 511) )
         )
         .setPort(getLastPort() )
      );
   //saveJSONObject(bG.toJSON(), "data/defaults/brickGenerator.json");
   saveJSONObject(player.toJSON(), "data/defaults/player.json");
   //.setController(new KeyboardController());
   //surface.setResizable(true);
}
void draw()
{
   background(0);
   physics.update(vectorizeObjects() );
   drawBricks(bricks);
   player.update();
   player.draw();
}
Serial getLastPort()
{
   String[] ports = Serial.list();
   String OS = System.getProperty("os.name").toLowerCase();
   if (ports.length > 0)
      if (OS.indexOf("win") >= 0)
         return new Serial(this, ports[ports.length - 1], 250000);
      else if (OS.indexOf("nix") >= 0 || OS.indexOf("nux") >= 0)
      {
         boolean found = false;
         int i = 0;
         for (; i < ports.length && !found; i++)
         {
            if (ports[i].indexOf("/dev/ttyACM") >=0)
               found = true;
         }
         return new Serial(this, ports[i], 250000);
      } else
         return null;
   else
      return null;
}
void drawBricks(Vector<Brick> bricks)
{
   for (int i = 0; i < bricks.size (); i++)
      bricks.elementAt(i).draw();
}
int[][] TwoDeeifyIntegerArray(int[] ints, int l)
{
   int[][] newInts = new int[ints.length][];
   for (int i = 0; i < newInts.length; i++)
   {
      newInts[i] = new int[l];
      for (int j = 0; j < newInts[i].length; j++)
         newInts[i][j] = ints[i];
   }
   return newInts;
}
ColorSet[][] reverseColorSettify(color[] colors, int rows, int cols)
{
   ColorSet[][] set = new ColorSet[colors.length][];
   for (int i = 0; i < rows; i++)
   {
      set[i] = new ColorSet[cols];
      for (int j = 0; j < cols; j++)
         set[i][j] = new ColorSet()
            .setPrimary(colors[(i + j) % colors.length]);
   }
   return set;
}
Vector<PhysicalObject> vectorizeObjects()
{
   Vector<PhysicalObject> vector = new Vector<PhysicalObject>();
   for (Brick brick : bricks)
      vector.add(brick);
   vector.add(player.getPaddle() );
   return vector;
}
