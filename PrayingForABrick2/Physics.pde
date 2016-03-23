import java.util.Vector;
import java.awt.geom.Rectangle2D;

class Physics implements GameConstants
{
   public void update(Vector<PhysicalObject> objects)
   {
      advance(objects);
   }
   private void advance(Vector<PhysicalObject> objects)
   {
      for(int i = 0; i < objects.size(); i++)
      {
         PhysicalObject object = objects.elementAt(i);
         object.getPosition().setX(object.getPosition().getX() + object.getPosition().getDeltaX() );
         object.getPosition().setY(object.getPosition().getY() + object.getPosition().getDeltaY() );
      }
   }
   private boolean collide(PhysicalObject p, PhysicalObject q)
   {
      int c = collideSide(p, q);
      if(c == DIRECTION_UP || c == DIRECTION_DOWN)
      {
         if(q.getPosition().getDeltaY() == 0)
         {
            Position pos = new Position(p.getPosition().getDeltaX(), p.getPosition().getDeltaY() );
            if(c == DIRECTION_UP)
               p.getPosition().setY(q.getPosition().getY() - p.getSize().getHeight() );
            else
               p.getPosition().setY(q.getPosition().getY() + q.getSize().getHeight() );
            p.getPosition().setDeltas(pos.getX(), -1 * pos.getY());
         }
         Position pos = new Position(p.getPosition().getDeltaX(), p.getPosition().getDeltaY() );
         p.getPosition().setDeltas(pos.getX(), -1 * pos.getY());
         return true;
      }
      else if(c == DIRECTION_LEFT || c == DIRECTION_RIGHT)
      {
         if(q.getPosition().getDeltaX() == 0)
         {
            Position pos = new Position(p.getPosition().getDeltaX(), p.getPosition().getDeltaY());
            if(c == DIRECTION_LEFT)
               p.getPosition().setX(q.getPosition().getX() - p.getSize().getWidth() );
            else
               p.getPosition().setX(q.getPosition().getX() + q.getSize().getWidth() );
            p.getPosition().setDeltas(-1 * pos.getX(), pos.getY());
         }
         Position pos = new Position(p.getPosition().getDeltaX(), p.getPosition().getDeltaY() );
         p.getPosition().setDeltas(-1 * pos.getX(), pos.getY());
         return true;
      }
      else
         return false;
   }
   private int collideSide(PhysicalObject p, PhysicalObject q)
   {
      if(didHitSide(p, q, DIRECTION_UP))
         return DIRECTION_UP;
      else if(didHitSide(p, q, DIRECTION_DOWN))
         return DIRECTION_DOWN;
      else if(didHitSide(p, q, DIRECTION_LEFT))
         return DIRECTION_LEFT;
      else if(didHitSide(p, q, DIRECTION_RIGHT))
         return DIRECTION_RIGHT;
      else return -1;
   }
   private Position getSide(PhysicalObject p, int side)
   {
      Position point = new Position();
      switch(p.getType() )
      {
         case SHAPE_RECT:
            switch(side)
            {
               case DIRECTION_UP:
                  point.setY(p.getPosition().getY());
                  point.setX(p.getPosition().getX());
                  break;
               case DIRECTION_DOWN:
                  point.setY(p.getPosition().getY() + p.getSize().getHeight());
                  point.setX(p.getPosition().getX());
                  break;
               case DIRECTION_LEFT:
                  point.setY(p.getPosition().getY());
                  point.setX(p.getPosition().getX());
                  break;
               case DIRECTION_RIGHT:
                  point.setY(p.getPosition().getY());
                  point.setX(p.getPosition().getX() + p.getSize().getWidth());
                  break;
               default:
                  return new Position(-1, -1);
            }
            return point;
         case SHAPE_ELLIPSE:
            switch(side)
            {
               case DIRECTION_UP:
                  point.setY(p.getPosition().getY() - p.getSize().getHeight() / 2);
                  point.setX(p.getPosition().getX() - p.getSize().getWidth() / 2);
                  break;
               case DIRECTION_DOWN:
                  point.setY(p.getPosition().getY() + p.getSize().getHeight() / 2);
                  point.setX(p.getPosition().getX() - p.getSize().getWidth() / 2);
                  break;
               case DIRECTION_LEFT:
                  point.setY(p.getPosition().getY() - p.getSize().getHeight() / 2);
                  point.setX(p.getPosition().getX() - p.getSize().getWidth() / 2);
                  break;
               case DIRECTION_RIGHT:
                  point.setY(p.getPosition().getY() - p.getSize().getHeight() / 2);
                  point.setX(p.getPosition().getX() + p.getSize().getWidth() / 2);
                  break;
               default:
                  return new Position(-1, -1);
            }
            return point;
         default:
            return new Position(-1, -1);
      }
   }
   private Rectangle2D.Float getTinyRectangle(float x, float y, float size, boolean isVertical, boolean additive)
   {
      if(!additive)
         x -= .001;
      if(isVertical)
         return new Rectangle2D.Float(x, y, .001, size);
      else
         return new Rectangle2D.Float(x, y, size, .001);
   }
   private Rectangle2D.Float[] getSidesAsRectangles(PhysicalObject p)
   {
      Rectangle2D.Float[] sides = new Rectangle2D.Float[4];
      for(int i = 0; i < 4; i ++)
      {
         Position pos = getSide(p, i);
         float size;
         boolean vertical, additive;
         if(i == DIRECTION_LEFT || i == DIRECTION_RIGHT)
         {
            size = p.getSize().getHeight();
            vertical = true;
            additive = (i == DIRECTION_LEFT);
         }
         else
         {
            vertical = false;
            size = p.getSize().getWidth();
            additive = (i == DIRECTION_DOWN);
         }
         sides[i] = getTinyRectangle(pos.getX(), pos.getY(), size, vertical, additive);
      }
      return sides;
   }
   private Boolean didHitSide(PhysicalObject p, PhysicalObject q, int side)
   {
      Rectangle2D.Float[] pSides = getSidesAsRectangles(p);
      Rectangle2D.Float[] qSides = getSidesAsRectangles(q);
      switch(side)
      {
         case DIRECTION_DOWN:
            return (qSides[DIRECTION_DOWN].intersects(pSides[DIRECTION_LEFT]) || qSides[DIRECTION_DOWN].intersects(pSides[DIRECTION_RIGHT]));
         case DIRECTION_UP:
            return (qSides[DIRECTION_UP].intersects(pSides[DIRECTION_LEFT]) || qSides[DIRECTION_UP].intersects(pSides[DIRECTION_RIGHT]));
         case DIRECTION_RIGHT:
            return (qSides[DIRECTION_RIGHT].intersects(pSides[DIRECTION_UP]) || qSides[DIRECTION_RIGHT].intersects(pSides[DIRECTION_DOWN]));
         case DIRECTION_LEFT:
            return (qSides[DIRECTION_LEFT].intersects(pSides[DIRECTION_UP]) || qSides[DIRECTION_LEFT].intersects(pSides[DIRECTION_DOWN]));
         default:
            return false;
      }
   }
}
