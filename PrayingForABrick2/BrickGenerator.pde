class BrickGenerator implements JSONifiable
{
   protected float spacing;
   protected int rows, cols;
   protected ColorSet[][] colors;
   MovingPosition position;
   public BrickGenerator()
   {
      setSpacing(0);
      setRows(1);
      setColumns(1);
      colors = new ColorSet[1][1];
      colors[0][0] = new ColorSet();
      setPosition(new MovingPosition() );
   }
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setFloat("spacing", spacing);
      obj.setInt("rows", rows);
      obj.setInt("columns", cols);
      obj.setJSONArray("colors", new JSONArray() );
      for(int i = 0; i < colors.length; i++)
      {
         obj.getJSONArray("colors").setJSONArray(i, new JSONArray() );
         for(int j = 0; j < colors[i].length; j++)
            obj.getJSONArray("colors").getJSONArray(i).setJSONObject(j, colors[i][j].toJSON() );
      }
      obj.setJSONObject("position", position.toJSON() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         if(!obj.isNull("spacing") && obj.getFloat("spacing") >= 0)
            setSpacing(obj.getFloat("spacing") );
         else
            setSpacing(0);
         if(!obj.isNull("rows") && obj.getInt("rows") >= 1)
            setRows(obj.getInt("rows") );
         else
            setRows(1);
         if(!obj.isNull("columns") && obj.getInt("columns") >= 1)
            setColumns(obj.getInt("columns") );
         else
            setColumns(1);
         if(!obj.isNull("colors") )
         {
            colors = new ColorSet[obj.getJSONArray("colors").size()][];
            for(int i = 0; i < colors.length; i++)
            {
               colors[i] = new ColorSet[obj.getJSONArray("colors").getJSONArray(i).size()];
               for(int j = 0; j < colors[i].length; j++)
               {
                  colors[i][j] = new ColorSet();
                  colors[i][j].fromJSON(obj.getJSONArray("colors").getJSONArray(i).getJSONObject(j) );
               }
            }
         }
         else
         {
            colors = new ColorSet[1][1];
            colors[0][0] = new ColorSet();
         }
         if(!obj.isNull("position") )
         {
            MovingPosition p = new MovingPosition();
            p.fromJSON(obj.getJSONObject("position") );
            setPosition(p);
         }
         else
            setPosition(new MovingPosition() );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
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
