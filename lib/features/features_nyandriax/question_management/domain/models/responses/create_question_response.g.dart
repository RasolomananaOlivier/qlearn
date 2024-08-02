// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuestionResponse _$CreateQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    CreateQuestionResponse(
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateQuestionResponseToJson(
        CreateQuestionResponse instance) =>
    <String, dynamic>{
      'question': instance.question,
    };
