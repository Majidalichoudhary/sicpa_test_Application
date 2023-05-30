import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../DB/DatabaseHelper.dart';
import '../DB/LocalModel.dart';
import '../Models/ArticlesModel.dart';
import '../constents.dart';

class ArticlesSearch {
  Future<List<ArticlesModel>> getAll(String article, String type) async {
    final url = type == "search" ?  '${Const.baseUrl}/search/v2/articlesearch.json?q=${article}&api-key=${Const.apikey}' :
    '${Const.baseUrl}/mostpopular/v2/${article}/30.json?api-key=${Const.apikey}'
    ;

    var dio = Dio();
    try {
      var response = await dio.get(url,  options: Options(
        responseType: ResponseType.plain,
      ));
      if(response.statusCode ==200){
        String  json = response.data.toString();
        print(json);
        Map<String, dynamic> user = jsonDecode(json);

        final arti= type == "search" ? user["response"]["docs"] as List : user["results"] as List;
        final articleslist = arti.map((e) {
          return ArticlesModel(
            title: e['abstract'],
            date: e[type == "search" ? 'pub_date' : 'updated'],
          );
        }).toList();

        for(int i = 0 ; i < arti.length ; i++)
          {
            Map<String, dynamic> row = LocalModel(
              title: arti[i]["abstract"] ?? "",
              date: arti[i][type == "search" ? 'pub_date' : 'updated'] ?? "",)
                .toJson();
            // print(row);
            await DatabaseHelper.instance.insert(row);
          }


        return articleslist;

      }
      return[];

    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
}