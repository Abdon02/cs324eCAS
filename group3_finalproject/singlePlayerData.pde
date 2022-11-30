/*
class singlePlayerData{
  Table t;
  int[] singleData;
  
  singlePlayerData(){
    t=loadTable("singleData.csv", "header");
    singleData =  new int[100000]; // Fix for flexible allocation
    for (TableRow r : t.rows()){
      t.append(r.getString("Score"));
      //singleData.add(r.getInt("Score"));
    }
  }
}
*/
