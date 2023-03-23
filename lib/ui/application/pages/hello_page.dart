import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_todo/ui/application/repository/data_service.dart';
import 'package:udemy_todo/ui/application/pages/blog_page.dart';
import 'package:udemy_todo/ui/auth/repository/auth_controller.dart';

// TextFieldの値を保存するプロバイダー
// 使い終わったら、状態を破棄するautoDisposeを追加しておく
final titleProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
final bodyProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

class HelloPage extends ConsumerWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ログアウトに必要なメソッドを呼び出す
    final authController = ref.read(authAsyncNotifierController.notifier);
    // TextEditingControllerを使えるように呼び出す
    final title = ref.watch(titleProvider);
    final body = ref.watch(bodyProvider);
    // データを保存するメソッドを呼び出す
    final dataService = ref.read(dataServiceProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                // ログアウトするメソッド
                authController.signOutAnonymously(context);
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('Auth'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: title,
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: body,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () async {
                // データを保存するメソッドを使用する。ボタンを押すと実行される
                dataService.addBlog(title.text, body.text, context);
              },
              child: const Text('投稿する')),
          ElevatedButton(
              onPressed: () {
                // ブログの投稿ページへ画面遷移する
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BlogPage()));
              },
              child: const Text('投稿内容を見る'))
        ],
      )),
    );
  }
}
