// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      count: json['_count'] == null
          ? null
          : CategoryCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      '_count': instance.count?.toJson(),
    };

CategoryCount _$CategoryCountFromJson(Map<String, dynamic> json) =>
    CategoryCount(
      quizzes: (json['quizzes'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryCountToJson(CategoryCount instance) =>
    <String, dynamic>{
      'quizzes': instance.quizzes,
    };
