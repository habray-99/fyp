// class UserDetail {
//   String? name;
//   String? email;
//   String? age;
//   String? userHeight;
//   String? userWidth;
//   String? userWeight;
//   String? bp;

//   UserDetail({
//     this.name,
//     this.email,
//     this.age,
//     this.userHeight,
//     this.userWidth,
//     this.userWeight,
//     this.bp,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['email'] = email;
//     data['age'] = age;
//     data['userHeight'] = userHeight;
//     data['userWidth'] = userWidth;
//     data['userWeight'] = userWeight;
//     data['bp'] = bp;
//     return data;
//   }

//   factory UserDetail.fromJson(Map<String, dynamic> json) {
//     return UserDetail(
//       name: json['name'] as String?,
//       email: json['email'] as String?,
//       age: json['age'] as String?,
//       userHeight: json['userHeight'] as String?,
//       userWidth: json['userWidth'] as String?,
//       userWeight: json['userWeight'] as String?,
//       bp: json['bp'] as String?,
//     );
//   }
// }


class Users {
  int? memberId;
  String? memberName;
  String? memberEmail;
  String? memberPhone;
  String? memberAddress;
  String? memberHeight;
  String? memberWeight;
  String? memberToken;
  int? memberType;
  String? tokenExpiry;

  Users(
      {this.memberId,
      this.memberName,
      this.memberEmail,
      this.memberPhone,
      this.memberAddress,
      this.memberHeight,
      this.memberWeight,
      this.memberToken,
      this.memberType,
      this.tokenExpiry});

  Users.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    memberName = json['member_name'];
    memberEmail = json['member_email'];
    memberPhone = json['member_phone'];
    memberAddress = json['member_address'];
    memberHeight = json['member_height'];
    memberWeight = json['member_weight'];
    memberToken = json['member_token'];
    memberType = json['member_type'];
    tokenExpiry = json['token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['member_name'] = memberName;
    data['member_email'] = memberEmail;
    data['member_phone'] = memberPhone;
    data['member_address'] = memberAddress;
    data['member_height'] = memberHeight;
    data['member_weight'] = memberWeight;
    data['member_token'] = memberToken;
    data['member_type'] = memberType;
    data['token_expiry'] = tokenExpiry;
    return data;
  }
}
