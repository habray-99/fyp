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

  factory Payments.fromJson(Map<String, dynamic> json) {
    return Payments(
      paymentId: json['paymentId'],
      paymentDate: json['paymentDate'] != null
          ? DateTime.parse(json['paymentDate']).toLocal()
          : null,
      memberId: json['memberId'],
      gymId: json['gymId'],
      months: json['months'],
      tillwhen: json['tillwhen'] != null
          ? DateTime.parse(json['tillwhen']).toLocal()
          : null,
      isValid: json['isValid'],
    );
  }
}

List<Payments> paymentsFromJson(List<dynamic> paymentsJson) =>
    List<Payments>.from(
        paymentsJson.map((payment) => Payments.fromJson(payment)));
