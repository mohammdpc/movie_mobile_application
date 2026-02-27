import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/api/api_constants.dart';
import 'package:movie/api/end_points.dart';
import 'package:movie/models/movie_response.dart';

class ApiManger{
  Future<MovieResponse> getMovies({ String? sortBy,String? orderBy,String? genre,String? limit}) async {
    Map<String,String> queryParameters = {};
    if(sortBy!=null){
      queryParameters["sort_by"] = sortBy;
    }
    if(orderBy!=null){
      queryParameters["order_by"] = orderBy;
    }
    if(genre!=null){
      queryParameters["genre"] = genre;
    }
    if(limit!=null){
      queryParameters["limit"] = limit;
    }
    Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.moviesApi,queryParameters);
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return MovieResponse.fromJson(json);
    }
    catch(e){
      rethrow;
    }
  }
}