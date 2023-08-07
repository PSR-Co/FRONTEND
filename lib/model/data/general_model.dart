class GeneralModel {
  final int code;
  final String message;

  GeneralModel({
    required this.code,
    required this.message,
  });

  factory GeneralModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return GeneralModel(
      code: json['code'],
      message: json['message'],
    );
  }
}