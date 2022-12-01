class singlePlayerData{
  Table t;
  int maxScore;

  singlePlayerData(){
    t=loadTable("singleData.csv", "header");
    maxScore = 0;
    for (TableRow r : t.rows()){
      int rowScore = r.getInt("Score");
      if (rowScore > maxScore){
        maxScore = rowScore;
      }
    }
  }
  
  void saveData(int score){
    boolean repeat = false;
    for (TableRow r : t.rows()){
      if (r.getInt("Score") == score){
        repeat = true;
        break;
      }
    }
    
    if (!repeat){
      TableRow newRow = t.addRow();
      newRow.setInt("Score", score);
      if (score > maxScore){
        maxScore = score;
      }
      saveTable(t, "singleData.csv");
    }    
  }
}
