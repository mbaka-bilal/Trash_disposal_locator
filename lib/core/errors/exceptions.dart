class LocationException implements Exception {
  const LocationException(this.exception, {this.message});

  final Object exception;
  final String? message;

  @override
  String toString() {
    return message ?? exception.toString();
  }
}
