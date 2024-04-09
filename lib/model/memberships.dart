
class Payments {
  int? paymentId;
  DateTime? paymentDate;
  int? memberId;
  int? gymId;
  int? months;
  DateTime? tillwhen;
  int? isValid;

  Payments({
    this.paymentId,
    this.paymentDate,
    this.memberId,
    this.gymId,
    this.months,
    this.tillwhen,
    this.isValid,
  });

  Payments.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    paymentDate = json['payment_date'] != null
        ? DateTime.parse(json['payment_date'])
        : null;
    memberId = json['member_id'];
    gymId = json['gym_id'];
    months = json['months'];
    tillwhen =
        json['tillwhen'] != null ? DateTime.parse(json['tillwhen']) : null;
    isValid = json['is_valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_id'] = paymentId;
    data['payment_date'] = paymentDate?.toIso8601String();
    data['member_id'] = memberId;
    data['gym_id'] = gymId;
    data['months'] = months;
    data['tillwhen'] = tillwhen?.toIso8601String();
    data['is_valid'] = isValid;
    return data;
  }
}

List<Payments> paymentsFromJson(List<dynamic> paymentsJson) =>
    List<Payments>.from(
        paymentsJson.map((payment) => Payments.fromJson(payment)));
