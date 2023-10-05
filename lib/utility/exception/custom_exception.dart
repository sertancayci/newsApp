class FirebaseCustomException implements Exception {
  final String message;
  FirebaseCustomException(this.message);

  @override
  String toString() => message;

}