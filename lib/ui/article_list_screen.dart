import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              onChanged: (query) {},
            ),
          ),
          Expanded(child: _buildResults())
        ],
      ),
    );
  }

  Widget _buildResults() {
    return const Center(child: Text("No Result"));
  }
}
