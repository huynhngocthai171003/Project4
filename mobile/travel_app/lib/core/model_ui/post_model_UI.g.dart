// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModelUI _$PostModelUIFromJson(Map<String, dynamic> json) => PostModelUI(
      id: json['id'] as int?,
      image: json['image'] as String,
      name: json['name'] as String,
      status: json['status'] as String?,
      postDate: DateTime.parse(json['postDate'] as String),
      hashtag: json['hashtag'] as String?,
      userId: AccountModelUI.fromJson(json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelUIToJson(PostModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'status': instance.status,
      'postDate': instance.postDate.toIso8601String(),
      'hashtag': instance.hashtag,
      'userId': instance.userId.toJson(),
    };
