class Students {
  final int? id;
  final String code;
  final String name;
  final String dept;
  final String phone;

  // 한번에 쓰기 편하게 하기 위해서
  Students(
    {
      this.id,
      required this.code,
      required this.name,
      required this.dept,
      required this.phone});

  // 불러오기 위함
  Students.fromMap(Map<String, dynamic> res)
  : id = res['id'],
    code = res['code'],
    name = res['name'],
    dept = res['dept'],
    phone = res['phone'];

  
  Map<String, Object?> toMap(){
    return {'id':id, 'code':code, 'name':name, 'dept':dept, 'phone':phone};
  }

}