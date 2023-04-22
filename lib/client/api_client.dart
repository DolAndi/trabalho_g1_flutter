import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:trabalho_g1/response/response_data.dart';

part 'api_client.g.dart';

class Apis {
  static const String mocky = "/b9c7c780-eaf4-4bbc-b44a-ed8828d0ebf6";
}

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.mocky)
  Future<ResponseData> getUsers();
}
