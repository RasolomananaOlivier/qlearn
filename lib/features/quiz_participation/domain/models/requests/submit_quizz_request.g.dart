// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quizz_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizzRequest _$SubmitQuizzRequestFromJson(Map<String, dynamic> json) =>
    SubmitQuizzRequest(
      quizId: (json['quizId'] as num).toInt(),
      sessionAnswers: (json['sessionAnswers'] as List<dynamic>)
          .map((e) => Map<String, int>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$SubmitQuizzRequestToJson(SubmitQuizzRequest instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'sessionAnswers': instance.sessionAnswers,
    };
