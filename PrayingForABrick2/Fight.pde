class Fight
{
   protected Vector<PlayerGroup> teams = new Vector<PlayerGroup>();
   protected int fightType;
   protected color bgColor;
   protected Vector<Brick> bricks = new Vector<Brick>();
   protected Size size;
   protected Position position;
   protected Vector<PowerUp> powerUps = new Vector<PowerUp>();
   public Fight(int fightType, int rows, int cols, color[][] colors)
   {
      setPosition(new Position(0, 0) );
      setSize(new Size(width, height) );
      setBackgroundColor(color(#000000, 255) );
      setFightType(fightType);
      setupBricks(rows, cols, colors);
   }
   protected void setupBricks(int rows, int cols, color[][] colors)
   {
      BrickGenerator bG = new BrickGenerator();
      switch(fightType)
      {
         case FIGHTTYPE_STANDARD:
            bricks = bG.standard(new MovingPosition(getPosition().getX(), position.getY() )
                                     .setXRange(new Range(getPosition().getX(), getPosition().getX() + getSize().getWidth() ) )
                                     .setYRange(new Range(getPosition().getY(), getPosition().getY() + getSize().getHeight() ) ),
                                 BRICK_SPACING,
                                 rows, cols,
                                 colors
                                );
            break;
      }
   }
   protected float getCenterX()
   {
      return (getPosition().getX() + getSize().getWidth() ) / 2 + getPosition().getX();
   }
   protected float getCenterY()
   {
      return (getPosition().getY() + getSize().getHeight() ) / 2 + getPosition().getY();
   }
   public Vector<PlayerGroup> getTeams()
   {
      return teams;
   }
   public Size getSize()
   {
      return size;
   }
   public Fight setSize(Size size)
   {
      this.size = size;
      return this;
   }
   public Position getPosition()
   {
      return position;
   }
   public Fight setPosition(Position position)
   {
      this.position = position;
      return this;
   }
   public color getBackgroundColor()
   {
      return bgColor;
   }
   public Fight setBackgroundColor(color bgColor)
   {
      this.bgColor = bgColor;
      return this;
   }
   public int getFightType()
   {
      return fightType;
   }
   public Fight setFightType(int fightType)
   {
      this.fightType = fightType;
      return this;
   }
   public Fight draw()
   {
      fill(bgColor);
      rect(getPosition().getX(), getPosition().getY(), getSize().getWidth(), getSize().getHeight() );
      for(int i = 0; i < teams.size(); i++)
         teams.elementAt(i).draw();
      for(int i = 0; i < bricks.size(); i++)
         bricks.elementAt(i).draw();
      for(int i = 0; i < powerUps.size(); i++)
         powerUps.elementAt(i).draw();
      return this;
   }
}