class LocationException implements Exception {
  const LocationException(this.exception, {this.message});

  final Object exception;
  final String? message;

  @override
  String toString() {
    return message ?? exception.toString();
  }
}


class ApiException implements Exception {
  const ApiException({required this.message});

  final String message;

  @override
  String toString() {
    return message;
  }
}

