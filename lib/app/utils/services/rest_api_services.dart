/// contains all service to get data from Server
class RestApiServices {
  static final RestApiServices _restApiServices = RestApiServices._internal();

  factory RestApiServices() {
    return _restApiServices;
  }
  RestApiServices._internal();

  // to get data from server, you can use Http for simple feature
  // or Dio for more complex feature

  // Example:
  // Future<ProductDetail?> getProductDetail(int id)async{
  //   var uri = Uri.parse(ApiPath.product + "/$id");
  //   try {
  //     return await Dio().getUri(uri);
  //   } on DioError catch (e) {
  //     print(e);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
