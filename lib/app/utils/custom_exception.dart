class ApiStatusException implements Exception {
  final String message;

  ApiStatusException({this.message = "something went wrong"});

  @override
  String toString() {
    return 'CustomException: $message';
  }
}
