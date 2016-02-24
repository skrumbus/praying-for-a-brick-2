class Hud extends Menu implements Drawable
{
   protected Health health;
   public JSONObject toJSON()
   {
      JSONObject obj = super.toJSON();
      obj.setJSONObject("health", getHealth().toJSON() );
      return obj;
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
