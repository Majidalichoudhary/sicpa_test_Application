
import 'package:flutter/foundation.dart';
import 'package:sicpa_test/Models/ArticlesModel.dart';
import 'package:sicpa_test/Services/ArticleSearch.dart';


class ArticlePr extends ChangeNotifier {
  final _service = ArticlesSearch();
  bool isLoading = false;
  List<ArticlesModel> _articles = [];
  List<ArticlesModel> get articles => _articles;

  Future<void> getArticlesbySearch( String article, String type) async {
  isLoading = true;
  notifyListeners();

  final response = await _service.getAll(article,type);

  _articles = response;
  isLoading = false;
  notifyListeners();
  }
  }
