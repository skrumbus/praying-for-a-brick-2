class PlayerGroup
{
   protected Vector<Ball> balls = new Vector<Ball>();
   protected Vector<Integer> holdingBalls = new Vector<Integer>();
   protected Vector<Player> players = new Vector<Player>();
   public Vector<Player> getPlayers()
   {
      return players;
   }
   public Vector<Ball> getBalls()
   {
      return balls;
   }
   public Vector<Integer> getHoldingBalls()
   {
      return holdingBalls;
   }
   public PlayerGroup draw()
   {
      for(int i = 0; i < balls.size(); i++)
         getBalls().elementAt(i).draw();
      for(int i = 0; i < players.size(); i ++)
         getPlayers().elementAt(i).draw();
      return this;
   }
}