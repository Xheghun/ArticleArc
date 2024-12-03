import 'dart:async';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/rw_client.dart';

class ArticleListBloc implements Bloc {
  final _client = RWClient();

  final _searchQueryController = StreamController<String>();

  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Article>?> articleStream;

  ArticleListBloc() {
    articleStream = _searchQueryController.stream
        .asyncMap((query) => _client.fetchArticles(query));
  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
