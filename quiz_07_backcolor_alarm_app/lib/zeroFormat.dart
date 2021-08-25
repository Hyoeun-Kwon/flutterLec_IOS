//1초에 한번씩 currenDateTime에 년-월-일 요일 시:분:초 입력 될때 자리수 맞춰 줘야함
// 10 아래 일경우 01, 02 이런식으로 표시하기 위함

class ZeroFormat {
  String monthZero(int month) {
    //int값으로 month를 주면 String 값으로 줄게!
    String workMonth = "";
    if (month < 10) {
      workMonth = "0$month";
    } else {
      workMonth = "$month";
    }
    return workMonth;
  } //monthZero

  String dayZero(int day) {
    String workDay = "";
    if (day < 10) {
      workDay = "0$day";
    } else {
      workDay = "$day";
    }
    return workDay;
  } //Zero

  String hourZero(int hour) {
    String workHour = "";
    if (hour < 10) {
      workHour = "0$hour";
    } else {
      workHour = "$hour";
    }
    return workHour;
  } //Zero

  String minZero(int min) {
    String workMin = "";
    if (min < 10) {
      workMin = "0$min";
    } else {
      workMin = "$min";
    }
    return workMin;
  } //Zero

  String secZero(int sec) {
    String workSec = "";
    if (sec < 10) {
      workSec = "0$sec";
    } else {
      workSec = "$sec";
    }
    return workSec;
  } //Zero
}//----
