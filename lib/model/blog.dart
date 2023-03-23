import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:udemy_todo/model/timestamp.dart';

part 'blog.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'blog.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class Blog with _$Blog {
  const factory Blog({
    required String id,
    required String title,
    required String body,
    @TimestampConverter() DateTime? createdAt,
  }) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}
