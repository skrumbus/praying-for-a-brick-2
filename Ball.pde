class Ball extends PhysicalObject
{
   protected boolean[] doDie = new boolean[4];
   public Ball()
   {
      super(OBJECT_ELLIPSE);
   }
   public Ball(MovingPosition position,
               float r,
               ColorSet myColor,
               boolean[] doDie)
   {
      super(position,
            new Size(r * 2, r * 2),
            myColor,
            OBJECT_ELLIPSE);
      setDoDie(doDie);
         
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
   public boolean getDoDieSide(int side)
   {
      if(side >= 0 && side < getDoDie().length)
         return getDoDie()[side];
      else
         return false;
   }
   public Ball setDoDie(boolean doDie, int side)
   {
      if(side >= 0 && side < getDoDie().length)
         this.doDie[side] = doDie;
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
      obj.setString("this", "Ball");
      obj.getJSONObject("size").remove("height");
      obj.getJSONObject("size").remove("width");
      obj.getJSONObject("size").setFloat("radius", getRadius() );
      obj.setJSONArray("doDie", new JSONArray() );
      for(int i = 0; i < doDie.length; i++)
         obj.getJSONArray("doDie").setBoolean(i, doDie[i]);
      return obj;
   }
}