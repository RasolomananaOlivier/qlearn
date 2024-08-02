// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      difficulty: (json['difficulty'] as num?)?.toDouble() ?? 1,
      count: json['_count'] == null
          ? null
          : QuizCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'questions': instance.questions,
      '_count': instance.count,
    };

QuizCount _$QuizCountFromJson(Map<String, dynamic> json) => QuizCount(
      quizzes: (json['quizzes'] as num).toInt(),
    );

Map<String, dynamic> _$QuizCountToJson(QuizCount instance) => <String, dynamic>{
      'quizzes': instance.quizzes,
    };
