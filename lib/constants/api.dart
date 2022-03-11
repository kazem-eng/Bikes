abstract class Api {
  static const connectionTimeout = 30000;

  // header keys
  static const headerContentTypeKey = 'Content-Type';
  static const headerContentTypeValue = 'application/json';
  static const baseURL =
      'https://run.mocky.io/v3/83b4d080-3d09-4d75-acb2-65b047b38ef8';
  static const placeholederURL = 'http://via.placeholder.com/350x150';

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
