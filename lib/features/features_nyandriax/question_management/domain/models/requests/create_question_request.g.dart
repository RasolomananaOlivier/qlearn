// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuestionRequest _$CreateQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    CreateQuestionRequest(
      content: json['content'] as String?,
      quizId: (json['quizId'] as num?)?.toInt(),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateQuestionRequestToJson(
        CreateQuestionRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'quizId': instance.quizId,
      'answers': instance.answers?.map((e) => e.toJson()).toList(),
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      content: json['content'] as String,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'content': instance.content,
      'isCorrect': instance.isCorrect,
    };
