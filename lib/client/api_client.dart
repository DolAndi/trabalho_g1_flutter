import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:trabalho_g1/response/response_data.dart';

part 'api_client.g.dart';

class Apis {
  static const String users = "/users";
}

@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<ResponseData> getUsers();
}
