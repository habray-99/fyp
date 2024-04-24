

class Gyms {
  int? gymId;
  String? gymName;
  String? gymAddress;
  String? gymPhone;
  String? gymEmail;
  String? gymPhotos;
  int? gymPrice;
  

  Gyms({
    this.gymId,
    this.gymName,
    this.gymAddress,
    this.gymPhone,
    this.gymEmail,
    this.gymPhotos,
    this.gymPrice,
  });

  factory Gyms.fromJson(Map<String, dynamic> json) {
    return Gyms(
      gymId: json['gym_id'],
      gymName: json['gym_name'],
      gymAddress: json['gym_address'],
      gymPhone: json['gym_phone'],
      gymEmail: json['gym_email'],
      gymPhotos: json['gym_photos'],
      gymPrice: json['gym_price'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gym_id': gymId,
      'gym_name': gymName,
      'gym_address': gymAddress,
      'gym_phone': gymPhone,
      'gym_email': gymEmail,
      'gym_photos': gymPhotos,
      'gym_price': gymPrice,
    };
  }
}

List<Gyms> gymDetailListFromJson(List<dynamic> gymDetailListJson) =>
    gymDetailListJson
        .map((gymDetailJson) =>
            Gyms.fromJson(gymDetailJson as Map<String, dynamic>))
        .toList();


// class GymDetail {
//   String? gymName;
//   String? gymAddress;
//   String? gymPhone;
//   List<String>? gymImg;

//   GymDetail(
//       {this.gymName,
//       this.gymAddress,
//       this.gymPhone,
//       this.gymImg});

//   GymDetail.fromJson(Map<String, dynamic> json) {
//     gymName = json['gym_name'];
//     gymAddress = json['gym_address'];
//     gymPhone = json['gym_phone'];
//     gymImg = List<String>.from(json['gym_img'].map((x) => x));
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['gym_name'] = gymName;
//     data['gym_address'] = gymAddress;
//     data['gym_phone'] = gymPhone;
//     data['gym_img'] = gymImg;
//     return data;
//   }
// }