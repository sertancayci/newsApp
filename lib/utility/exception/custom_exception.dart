class FirebaseCustomException implements Exception {
  final String message;
  FirebaseCustomException(this.message);

  @override
  String toString() => message;

}

class VersionCustomException implements Exception {
  final String message;
  VersionCustomException(this.message);

  @override
  String toString() {
    return '$this $message';
  }

}