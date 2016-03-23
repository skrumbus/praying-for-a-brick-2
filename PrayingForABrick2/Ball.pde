class Ball extends PhysicalObject implements Drawable, JSONifiable, GameConstants
{
   protected boolean[] doDie = new boolean[4];
   public Ball()
   {
      super(SHAPE_ELLIPSE);
      for(int i = 0; i < getDoDie().length; i++)
         getDoDie()[i] = false;
      setDoesBounce(true);
   }
   public Ball(MovingPosition position,
               float r,
               ColorSet myColor,
               boolean[] doDie)
   {
      super(position,
            new Size(r * 2, r * 2),
            myColor,
            SHAPE_ELLIPSE);
      setDoDie(doDie);
      setDoesBounce(true);
   }
   public boolean[] getDoDie()
   {
      return doDie;
   }
   public Ball setDoDie(boolean[] doDie)
   {
      if(doDie.length >= this.doDie.length)
         for(int i = 0; i < this.doDie.length; i++)
            this.doDie[i] = doDie[i];
      return this;
   }
   public float getRadius()
   {
      return size.getHeight() / 2;
   }
   public Ball setRadius(float r)
   {
      size.setWidth(r * 2);
      size.setHeight(r * 2);
      return this;
   }
   public Ball setColor(ColorSet myColor)
   {
      super.setColor(myColor);
      return this;
   }
   public Ball setPosition(MovingPosition position)
   {
      super.setPosition(position);
      return this;
   }
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONArray("doDie", new JSONArray() );
      for(int i = 0; i < getDoDie().length; i++)
         obj.getJSONArray("doDie").setBoolean(i, getDoDie()[i]);
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         obj.setString("this", super.getClass().getSimpleName() );
         super.fromJSON(obj);
         if(!obj.isNull("doDie") )
            for(int i = 0; i < getDoDie().length; i++)
               getDoDie()[i] = obj.getJSONArray("doDie").getBoolean(i);
         else
            for(int i = 0; i < getDoDie().length; i++)
               getDoDie()[i] = false;
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Ball draw()
   {
      super.draw();
      return this;
   }
   public Ball setDoesBounce(boolean doesBounce)
   {
      super.setDoesBounce(doesBounce);
      return this;
   }
}
