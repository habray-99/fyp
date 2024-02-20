class UserDetail {
  String? name;
  String? email;
  String? age;
  String? userHeight;
  String? userWidth;
  String? userWeight;
  String? bp;

  UserDetail({
    this.name,
    this.email,
    this.age,
    this.userHeight,
    this.userWidth,
    this.userWeight,
    this.bp,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['userHeight'] = userHeight;
    data['userWidth'] = userWidth;
    data['userWeight'] = userWeight;
    data['bp'] = bp;
    return data;
  }

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      name: json['name'] as String?,
      email: json['email'] as String?,
      age: json['age'] as String?,
      userHeight: json['userHeight'] as String?,
      userWidth: json['userWidth'] as String?,
      userWeight: json['userWeight'] as String?,
      bp: json['bp'] as String?,
    );
  }
}
