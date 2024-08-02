import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/category.dart';

part 'get_categories_response.g.dart';

@JsonSerializable()
class GetCategoriesResponse {
  final List<Category> categories;

  GetCategoriesResponse({required this.categories});

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesResponseToJson(this);
}
