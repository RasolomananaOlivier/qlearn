// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzesRequest _$QuizzesRequestFromJson(Map<String, dynamic> json) =>
    QuizzesRequest(
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      difficulty: (json['difficulty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizzesRequestToJson(QuizzesRequest instance) =>
    <String, dynamic>{
      'categoryIds': instance.categoryIds,
      'difficulty': instance.difficulty,
    };
