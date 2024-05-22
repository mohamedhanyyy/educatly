class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});

  @override
  String toString() => message;
}

class UnAuthorizedException implements Exception {
  const UnAuthorizedException();
}

class UnRegisteredSocialException implements Exception {
  const UnRegisteredSocialException({required this.message});

  final String message;

  @override
  String toString() => message;
}

class BlockedUserException implements Exception {
  const BlockedUserException({required this.message});

  final String message;

  @override
  String toString() => message;
}

class DatabaseException implements Exception {
  const DatabaseException();
}
