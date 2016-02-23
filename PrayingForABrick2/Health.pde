class Health
{
   protected int currentHealth;
   protected int maxHealth;
   public JSONObject toJSON()
   {
      JSONObject obj = new JSONObject();
      obj.setString("this", this.getClass().getSimpleName() );
      obj.setInt("currentHealth", getCurrentHealth() );
      obj.setInt("maxHealth", getMaxHealth() );
      return obj;
   }
   public Health()
   {
      setMaxHealth(0);
      setCurrentHealth(0);
   }
   public Health(int health)
   {
      setMaxHealth(health);
      setCurrentHealth(health);
   }
   public Health(int currentHealth, int maxHealth)
   {
      setMaxHealth(maxHealth);
      setCurrentHealth(currentHealth);
   }
   public int getCurrentHealth()
   {
      return currentHealth;
   }
   public Health setCurrentHealth(int currentHealth)
   {
      if(currentHealth < 0)
         currentHealth = 0;
      else if(currentHealth > getMaxHealth() )
         currentHealth = getMaxHealth();
      this.currentHealth = currentHealth;
      return this;
   }
   public int getMaxHealth()
   {
      return maxHealth;
   }
   public Health setMaxHealth(int maxHealth)
   {
      if(maxHealth < 0)
         maxHealth = 0;
      this.maxHealth = maxHealth;
      return this;
   }
}
