class Hud extends Menu implements Drawable, JSONifiable
{
   protected Health health;
   public Hud()
   {
      super();
      setHealth(new Health() );
   }
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setJSONObject("health", getHealth().toJSON() );
      return obj;
   }
   public void fromJSON(JSONObject obj)
   {
      if(!obj.isNull("this") && obj.getString("this").equals(this.getClass().getSimpleName() ) )
      {
         obj.setString("this", super.getClass().getSimpleName() );
         super.fromJSON(obj);
         if(!obj.isNull("health") )
         {
            Health h = new Health();
            h.fromJSON(obj.getJSONObject("health") );
            setHealth(h);
         }
         else
            setHealth(new Health() );
      }
      else
         println("Invalid JSONObject passed to " + this.getClass().getSimpleName() + " class." );
   }
   public Health getHealth()
   {
      return health;
   }
   public Hud setHealth(Health health)
   {
      this.health = health;
      return this;
   }
}
