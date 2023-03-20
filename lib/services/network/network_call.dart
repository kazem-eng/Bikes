import 'dart:io';

import 'package:http/http.dart';

import 'package:bikes/constants/api.dart';
import 'package:bikes/helpers/exception.dart';
import 'package:bikes/services/network/network.dart';

class NetworkCall extends INetworkService {
  NetworkCall({
    required Client client,
  }) : _client = client;

  final Client _client;

  static const _header = {Api.headerContentTypeKey: Api.headerContentTypeValue};
  static const _timeout = Duration(seconds: Api.connectionTimeout);

  @override
  Future get({
    String? path,
    Map<String, String>? header,
  }) async {
    late dynamic responseJson;
    try {
      final uri = Uri.parse('${Api.baseURL}${path ?? ''}');
      final response = await _client
          .get(
            uri,
            headers: header ?? _header,
          )
          .timeout(_timeout);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: Api.noConnection);
    } on FormatException {
      throw FormatException();
    } catch (error) {
      throw UnknowException(message: error.toString());
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException();
      case 401:
      case 403:
      case 422:
        throw UnauthorisedException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            message: '${Api.connectionFailure}${response.statusCode}}');
    }
  }
}
