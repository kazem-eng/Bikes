abstract class Api {
  static const connectionTimeout = 10;

  // header keys
  static const headerContentTypeKey = 'Content-Type';
  static const headerContentTypeValue = 'application/json';
  static const baseURL =
      'https://run.mocky.io/v3/e90916b5-d693-47e3-92ce-0b250f5f5150';
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

  static const contextMenuException = 'Either icon or title should be provided';
  static const heroException =
      'Either imageAsset or imageURL must be provided when using avatar type';
  static const customDialogException =
      'Either header or title must be provided';
  static const dialogErrorException =
      'barrierLabel must be provided when dialog is dismissible';
}
