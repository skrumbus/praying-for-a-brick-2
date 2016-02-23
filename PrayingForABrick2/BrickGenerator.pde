class BrickGenerator
{
   public Vector<Brick> standard(MovingPosition position, float spacing, int rows, int cols, color[][] colors)
   {
      Size size = new Size(position.getXRange().getTotal() / cols - spacing, position.getYRange().getTotal() / rows - spacing);
      float xOffset = position.getXRange().getMin() + spacing / 2;
      float yOffset = position.getYRange().getMin() + spacing / 2;
      position.setDeltaX(size.getWidth() + spacing);
      position.setDeltaY(size.getHeight() + spacing);
      position.setX(xOffset);
      position.setY(yOffset);
      Vector<Brick> bricks = new Vector<Brick>();
      println("rows" + rows);
      println("columns" + cols);
      for(int i = 0; i < rows; i++)
      {
         for(int j = 0; j < cols; j++)
         {
            MovingPosition p = new MovingPosition(position.getX(), position.getY() );
            int iIndex = mapToArray(i, new Range(0, rows - 1), colors.length - 1);
            int jIndex = mapToArray(j, new Range(0, rows - 1), colors[iIndex].length - 1);
            Brick brick = new Brick()
                              .setPosition(p)
                              .setSize(size)
                              .setColor(new ColorSet()
                                            .setPrimary(colors[iIndex][jIndex])
                                            .setStroke(color(#FFFFFF, 0) ) 
                                       )
                              .setHealth(new Health(1) );
            bricks.add(brick);
            position.advance(true, false);
         }
         position.setX(xOffset);
         position.advance(false, true);
      }
      return bricks;
   }
   protected int mapToArray(int i, Range range, int l)
   {
      return (int) constrain(map(i, range.getMin(), range.getMax(), 0, l), 0, l);
   }
}
