import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_todo/model/blog.dart';

final dataServiceProvider = StateProvider<DataService>((ref) => DataService());

class DataService {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  // Firestoreにデータを保存するメソッド
  Future<void> addBlog(String title, String body, BuildContext context) async {
    try {
      if (title.isEmpty) {
        throw ('タイトルが入力されていません!');
      }

      if (body.isEmpty) {
        throw ('投稿内容が入力されていません!');
      }

      // uid取得する変数
      final uid = auth.currentUser?.uid;
      // Freezedのモデルクラスで定義した型を使ってデータを保存する
      final newBlog = Blog(
          id: uid.toString(),
          title: title,
          body: body,
          createdAt: DateTime.now());

      await db.collection('blog').doc(uid).set(newBlog.toJson());
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // throwのエラーメッセージがダイアログで表示される.
              title: Text(e.toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
