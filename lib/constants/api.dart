abstract class Api {
  static const connectionTimeout = 30000;

  // header keys
  static const headerContentTypeKey = 'Content-Type';
  static const headerContentTypeValue = 'application/json';
  static const baseURL =
      'https://run.mocky.io/v3/08634b88-93b7-484e-9501-7cb38a073bf1';

  // Error Messages:
  static const noConnection = 'No Internet connection';
  static const connectionFailure = 'Communication Failure. ';
  static const invalidRequest = 'Invalid Request. ';
  static const unauthorizedRequest = 'Unauthorised. ';
  static const communicationError = 'Error During Communication. ';
  static const serverError = 'Server Error. ';
  static const unknownError = 'Something went wrong. ';
  static const formatException = 'Invalid format. Please check url format. ';
}
