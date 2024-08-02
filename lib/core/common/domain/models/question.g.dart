// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['_count'] == null
          ? null
          : QuestionCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'answers': instance.answers,
      '_count': instance.count,
    };

QuestionCount _$QuestionCountFromJson(Map<String, dynamic> json) =>
    QuestionCount(
      count: (json['count'] as num).toInt(),
      success: (json['success'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$QuestionCountToJson(QuestionCount instance) =>
    <String, dynamic>{
      'count': instance.count,
      'success': instance.success,
      'rate': instance.rate,
    };
