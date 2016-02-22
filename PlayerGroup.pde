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
   public  Vector<Integer> getHoldingBalls()
   {
      return holdingBalls;
   }
}