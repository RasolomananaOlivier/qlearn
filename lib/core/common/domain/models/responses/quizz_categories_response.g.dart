// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizz_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzCategoriesResponse _$QuizzCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    QuizzCategoriesResponse(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => QuizCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizzCategoriesResponseToJson(
        QuizzCategoriesResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
