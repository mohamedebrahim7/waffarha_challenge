import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/models.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/photos')
  @GET('/photos')
  Future<List<Album>> getAlbumsPage(
    @Query('_limit') int limit,
    @Query('_page') int page,
    @Query('_sort') String? sortBy, // Optional sorting field
    @Query('_order') String? order, // Optional order direction (asc or desc)
    @Query('albumId') int? albumId, // Optional filtering by albumId
  );
}
