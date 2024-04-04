class Users {
  int? memberId;
  String? memberName;
  String? memberEmail;
  String? memberPhone;
  String? memberAddress;
  String? memberPassword;
  String? memberHeight;
  String? memberWeight;
  String? memberToken;
  int? memberType;
  DateTime? tokenExpiry;
  String? memberImageUrl;

  Users({
    this.memberId,
    this.memberName,
    this.memberEmail,
    this.memberPhone,
    this.memberAddress,
    this.memberPassword,
    this.memberHeight,
    this.memberWeight,
    this.memberToken,
    this.memberType,
    this.tokenExpiry,
    this.memberImageUrl,
  });
  factory Users.fromJson(Map<String, dynamic> json) => Users(
        memberId: json["member_id"],
        memberName: json["member_name"],
        memberEmail: json["member_email"],
        memberPhone: json["member_phone"],
        memberAddress: json["member_address"],
        memberHeight: json["member_height"],
        memberWeight: json["member_weight"],
        memberToken: json["member_token"],
        memberType: json["member_type"],
        tokenExpiry: json["token_expiry"] == null
            ? null
            : DateTime.parse(json["token_expiry"]),
        memberImageUrl: json["member_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "member_id": memberId,
        "member_name": memberName,
        "member_email": memberEmail,
        "member_phone": memberPhone,
        "member_address": memberAddress,
        "member_height": memberHeight,
        "member_weight": memberWeight,
        "member_type": memberType,
        "member_token": memberToken,
        "member_image_url": memberImageUrl,
      };
}
