abstract class Api {
  static const connectionTimeout = 10;

  // header keys
  static const headerContentTypeKey = 'Content-Type';
  static const headerContentTypeValue = 'application/json';
  static const baseURL =
      'https://run.mocky.io/v3/46176922-5164-4527-932e-ae4d8b0dca63';
  static const placeholederURL = 'http://via.placeholder.com/350x150';

  // Error Messages:
  static const noConnection =
      'No Internet connection\nTo see pictures please check your connectivity';
  static const connectionFailure = 'Communication Failure. ';
  static const invalidRequest = 'Invalid Request. ';
  static const unauthorizedRequest = 'Unauthorised. ';
  static const communicationError = 'Error During Communication. ';
  static const serverError = 'Server Error. ';
  static const unknownError = 'Something went wrong. ';
  static const formatException = 'Invalid format. Please check url format. ';
}
