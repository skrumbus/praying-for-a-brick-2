class BrickGenerator
{
   protected float spacing;
   protected int rows, cols;
   protected ColorSet[][] colors;
   MovingPosition position;
   public BrickGenerator()
   {
      setSpacing(0);
      setRows(0);
      setColumns(0);
      setColors(new ColorSet[0][0]);
      setPosition(new MovingPosition(0,0) );
   }
   public float getSpacing()
   {
      return spacing;
   }
   public BrickGenerator setSpacing(float spacing)
   {
      if(spacing < 0)
         spacing = 0;
      this.spacing = spacing;
      return this;
   }
   public int getRows()
   {
      return rows;
   }
   public BrickGenerator setRows(int rows)
   {
      if(rows <= 0)
         rows = 1;
      this.rows = rows;
      return this;
   }
   public int getColumns()
   {
      return cols;
   }
   public BrickGenerator setColumns(int cols)
   {
      if(cols <= 0)
         cols = 1;
      this.cols = cols;
      return this;
   }
   public MovingPosition getPosition()
   {
      return position;
   }
   public BrickGenerator setPosition(MovingPosition position)
   {
      this.position = position;
      return this;
   }
   public ColorSet[][] getColors()
   {
      return colors;
   }
   public BrickGenerator setColors(ColorSet[][] colors)
   {
      this.colors = colors;
      return this;
   }
   public Vector<Brick> standard()
   {
      Size size = new Size(getPosition().getXRange().getTotal() / getColumns() - getSpacing(), getPosition().getYRange().getTotal() / getRows() - getSpacing() );
      float xOffset = getPosition().getXRange().getMin() + getSpacing() / 2;
      float yOffset = getPosition().getYRange().getMin() + getSpacing() / 2;
      getPosition().setDeltaX(size.getWidth() + getSpacing() );
      getPosition().setDeltaY(size.getHeight() + getSpacing() );
      getPosition().setX(xOffset);
      getPosition().setY(yOffset);
      Vector<Brick> bricks = new Vector<Brick>();
      for(int i = 0; i < getRows(); i++)
      {
         for(int j = 0; j < cols; j++)
         {
            MovingPosition p = new MovingPosition(getPosition().getX(), getPosition().getY() );
            int iIndex = mapToArray(i, new Range(0, getRows() - 1), getColors().length - 1);
            int jIndex = mapToArray(j, new Range(0, getColumns() - 1), getColors()[iIndex].length - 1);
            Brick brick = new Brick()
                              .setPosition(p)
                              .setSize(size)
                              .setColor(getColors()[iIndex][jIndex])
                              .setHealth(new Health(1) );
            bricks.add(brick);
            getPosition().advance(true, false);
         }
         getPosition().setX(xOffset);
         getPosition().advance(false, true);
      }
      return bricks;
   }
   protected int mapToArray(int i, Range range, int l)
   {
      return (int) constrain(map(i, range.getMin(), range.getMax(), 0, l), 0, l);
   }
}