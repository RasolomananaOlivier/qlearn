// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quizz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizzResponse _$SubmitQuizzResponseFromJson(Map<String, dynamic> json) =>
    SubmitQuizzResponse(
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitQuizzResponseToJson(
        SubmitQuizzResponse instance) =>
    <String, dynamic>{
      'session': instance.session,
    };
