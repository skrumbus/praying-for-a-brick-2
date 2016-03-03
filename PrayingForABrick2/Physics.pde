import java.util.Vector;

class Physics
{
   void update(Vector<PhysicalObject> objects)
   {
      for(PhysicalObject object : objects)
      {
         object.getPosition().setX(object.getPosition().getX() + object.getPosition().getDeltaX() );
         object.getPosition().setY(object.getPosition().getY() + object.getPosition().getDeltaY() );
      }
   }
}
