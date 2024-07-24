// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzesRequest _$QuizzesRequestFromJson(Map<String, dynamic> json) =>
    QuizzesRequest(
      categoryId: (json['categoryId'] as num?)?.toInt(),
      difficulty: (json['difficulty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizzesRequestToJson(QuizzesRequest instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'difficulty': instance.difficulty,
    };
