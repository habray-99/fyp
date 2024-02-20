List<GymDetail> gymDetailListFromJson(List<dynamic> gymDetailListJson) =>
    List<GymDetail>.from(gymDetailListJson
        .map((gymDetailJson) => GymDetail.fromJson(gymDetailJson)));

class GymDetail {
  String? gymName;
  String? gymAddress;
  String? gymPhone;
  List<String>? gymImg;

  GymDetail(
      {this.gymName,
      this.gymAddress,
      this.gymPhone,
      this.gymImg});

  GymDetail.fromJson(Map<String, dynamic> json) {
    gymName = json['gym_name'];
    gymAddress = json['gym_address'];
    gymPhone = json['gym_phone'];
    gymImg = List<String>.from(json['gym_img'].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gym_name'] = gymName;
    data['gym_address'] = gymAddress;
    data['gym_phone'] = gymPhone;
    data['gym_img'] = gymImg;
    return data;
  }
}
