import 'package:bikes/constants/constants.dart';

class BaseException implements Exception {
  BaseException({
    required this.prefix,
    required this.message,
  });

  final String prefix;
  final String message;

  @override
  String toString() {
    return '$prefix$message';
  }
}

//Network Exceptions
class FetchDataException extends BaseException {
  FetchDataException({String? message})
      : super(
          message: message ?? '',
          prefix: Api.communicationError,
        );
}

class BadRequestException extends BaseException {
  BadRequestException({String? message})
      : super(
          message: message ?? '',
          prefix: Api.invalidRequest,
        );
}

class UnauthorisedException extends BaseException {
  UnauthorisedException({String? message})
      : super(
          message: message ?? '',
          prefix: Api.unauthorizedRequest,
        );
}

class ServerException extends BaseException {
  ServerException({String? message})
      : super(
          message: message ?? '',
          prefix: Api.serverError,
        );
}

class UnknowException extends BaseException {
  UnknowException({String? message})
      : super(
          message: message ?? '',
          prefix: Api.unknownError,
        );
}

class FormatException extends BaseException {
  FormatException({String? message})
      : super(
          message: message ?? '',
          prefix: Api.formatException,
        );
}
