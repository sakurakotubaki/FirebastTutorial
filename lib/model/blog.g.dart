// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Blog _$$_BlogFromJson(Map<String, dynamic> json) => _$_Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_BlogToJson(_$_Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
