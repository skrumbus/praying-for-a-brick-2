class BrickGenerator
{
   public Vector<Brick> standard(MovingPosition position, float spacing, int rows, int cols, color[][] colors)
   {
      Size size = new Size(position.getXRange().getTotal() / rows - spacing, position.getYRange().getTotal() / cols - spacing);
      float xOffset = position.getXRange().getMin() + spacing / 2;
      float yOffset = position.getYRange().getMin() + spacing / 2;
      position.setDeltas(size.getWidth() + spacing, size.getHeight() + spacing);
      position.setX(xOffset);
      position.setY(yOffset);
      Vector<Brick> bricks = new Vector<Brick>();
      for(int i = 0; i < rows; i++)
      {
         for(int j = 0; j < cols; j++)
         {
            bricks.add(new Brick()
                           .setPosition(position)
                           .setSize(size)
                           .setColor(new ColorSet()
                                         .setPrimary(color(#FFFFFF, 255) )
                                         .setStroke(color(#FFFFFF, 255) ) 
                                    )
                           .setHealth(new Health(1) )
                      );
            position.advance(true, false);
         }
         position.setX(xOffset);
         position.advance(false, true);
      }
      return bricks;
   }
}