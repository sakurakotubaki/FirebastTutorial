import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_todo/model/blog.dart';

final blogStreamProvider = StreamProvider<List<Blog>>((ref) {
  final collection = FirebaseFirestore.instance.collection('blog');

  final stream = collection.snapshots().map(
        (e) => e.docs.map((e) => Blog.fromJson(e.data())).toList(),
      );
  return stream;
});
