interface JSONifiable
{
   public JSONObject toJSON();
   public JSONifiable fromJSON(JSONObject obj);
}