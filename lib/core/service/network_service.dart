abstract interface class NetworkServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(payload, url);
}
