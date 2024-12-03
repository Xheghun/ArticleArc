import 'package:article_finder/bloc/article_details_bloc.dart';
import 'package:article_finder/bloc/block_provider.dart';
import 'package:article_finder/ui/article_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticleDetailsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Detail"),
      ),
      body: RefreshIndicator(
        onRefresh: bloc.refresh,
        child: Container(
          alignment: Alignment.center,
          child: _buildContent(bloc),
        ),
      ),
    );
  }
}

Widget _buildContent(ArticleDetailsBloc bloc) {
  return StreamBuilder(
      stream: bloc.articleStream,
      builder: (context, snapshot) {
        final article = snapshot.data;
        if (article == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ArticleDetail(article);
      });
}
