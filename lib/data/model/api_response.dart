class ApiResponse {
  List get data => body["data"];
  // Just a way of saying there was no error with the request and response return
  bool get allGood => errors.length == 0;
  int code;
  String message;
  dynamic body;
  List errors;
  String otpdata;

  ApiResponse({
    this.code,
    this.message,
    this.body,
    this.errors,
    this.otpdata
  });
}
