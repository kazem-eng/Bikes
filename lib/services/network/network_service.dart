abstract class INetworkService<T> {
  Future<T> get({
    String? path,
    Map<String, String>? header,
  });
}
