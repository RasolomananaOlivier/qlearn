// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizCategory _$QuizCategoryFromJson(Map<String, dynamic> json) => QuizCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      count: json['_count'] == null
          ? null
          : CategoryCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizCategoryToJson(QuizCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      '_count': instance.count,
    };

CategoryCount _$CategoryCountFromJson(Map<String, dynamic> json) =>
    CategoryCount(
      quizzes: (json['quizzes'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryCountToJson(CategoryCount instance) =>
    <String, dynamic>{
      'quizzes': instance.quizzes,
    };
