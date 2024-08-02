// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      description: json['description'] as String,
      name: json['name'] as String,
      difficulty: (json['difficulty'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'difficulty': instance.difficulty,
      'categoryId': instance.categoryId,
    };
