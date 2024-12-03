import 'package:article_finder/bloc/article_details_bloc.dart';
import 'package:article_finder/bloc/article_list_bloc.dart';
import 'package:article_finder/bloc/block_provider.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/ui/article_details_screen.dart';
import 'package:article_finder/ui/article_list_item.dart';
import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticleListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Search ....'),
              onChanged: bloc.searchQuery.add,
            ),
          ),
          Expanded(child: _buildResults(bloc))
        ],
      ),
    );
  }

  Widget _buildResults(ArticleListBloc bloc) {
    return StreamBuilder<List<Article>?>(
        stream: bloc.articleStream,
        builder: (context, snapshot) {
          final results = snapshot.data;
          if (results == null) {
            return const Center(child: Text("Loading...."));
          } else if (results.isEmpty) {
            return const Center(child: Text("No Result"));
          }

          return _buildSearchResult(results);
        });
  }

  Widget _buildSearchResult(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        bloc: ArticleDetailsBloc(id: article.id),
                        child: const ArticleDetailsScreen())));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ArticleListItem(article: article),
          ),
        );
      },
    );
  }
}
