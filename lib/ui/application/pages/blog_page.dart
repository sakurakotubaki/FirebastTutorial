import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_todo/ui/application/repository/blog_provider.dart';

class BlogPage extends ConsumerWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // blogコレクションのデータを全て取得する
    final blogData = ref.watch(blogStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Page'),
      ),
      body: blogData.when(
          // データを読み込んでいるとローディングの処理がされる
          loading: () => const CircularProgressIndicator(),
          // エラーが発生するとエラーが表示される
          error: (error, stack) => Text('Error: $error'),
          // Streamで取得したデータが表示される
          data: (blogData) {
            return ListView.builder(
                itemCount: blogData.length,
                itemBuilder: (context, index) {
                  final blog = blogData[index];
                  return ListTile(
                    title: Text(blog.title),
                    subtitle: Text(blog.body),
                  );
                });
          }),
    );
  }
}
