class Result {
  String? notificationId;
  String? title;
  String? message;
  String? customerId;
  String? date;

  Result({
    this.notificationId,
    this.title,
    this.message,
    this.customerId,
    this.date,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        notificationId: json['notification_id'] as String?,
        title: json['title'] as String?,
        message: json['message'] as String?,
        customerId: json['customer_id'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'notification_id': notificationId,
        'title': title,
        'message': message,
        'customer_id': customerId,
        'date': date,
      };
}
