// 어레이 리스트에 한번에 넣으려고 박스를 만드는 것 - Bean (박싱)
// table 각 한줄 값을 위해
class TodoList {
  String imagePath;
  String workList;

  //생성자 : 안만들어주려면 초기값 있어야 함
  TodoList({required this.imagePath, required this.workList});
  //required 쓰면 뒤에 만들어 주는 애구나 하고 오류가 안걸림
}
