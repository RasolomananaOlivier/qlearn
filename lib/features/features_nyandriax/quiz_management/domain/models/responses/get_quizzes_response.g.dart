// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quizzes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuizzesResponse _$GetQuizzesResponseFromJson(Map<String, dynamic> json) =>
    GetQuizzesResponse(
      quizzes: (json['quizzes'] as List<dynamic>)
          .map((e) => Quiz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuizzesResponseToJson(GetQuizzesResponse instance) =>
    <String, dynamic>{
      'quizzes': instance.quizzes,
    };
