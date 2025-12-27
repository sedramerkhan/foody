
enum ServerErrorType {
  unknownError("-1"),
  connectionError("-2");

  const ServerErrorType(this.code);

  factory ServerErrorType.fromCode(String code) {
    return values.firstWhere(
      (e) => e.code == code,
      orElse: () => ServerErrorType.unknownError,
    );
  }

  final String code;

  String message() {
    switch (this) {

      default:
        return "Unknown Error";
    }
  }
}
