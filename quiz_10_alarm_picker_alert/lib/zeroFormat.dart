class ZeroFormat {
  
  String monthZero(int month){
    String workMonth = "";
    if (month < 10) {
      workMonth = "0$month";
    } else {
      workMonth = "$month";
    }
    return workMonth;
  }

  String dayZero(int day){
    String workDay = "";
    if (day < 10) {
      workDay = "0$day";
    } else {
      workDay = "$day";
    }
    return workDay;
  }

  String hourZero(int hour){
    String workHour = "";
    if (hour < 10) {
      workHour = "0$hour";
    } else {
      workHour = "$hour";
    }
    return workHour;
  }

  String minZero(int min){
    String workMin = "";
    if (min < 10) {
      workMin = "0$min";
    } else {
      workMin = "$min";
    }
    return workMin;
  }

  String secZero(int sec){
    String workSec = "";
    if (sec < 10) {
      workSec = "0$sec";
    } else {
      workSec = "$sec";
    }
    return workSec;
  }

}