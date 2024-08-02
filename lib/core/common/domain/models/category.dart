import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final int id;
  final String name;
  final String? description;

  @JsonKey(name: '_count')
  final CategoryCount? count;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.count,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description}';
  }
}

@JsonSerializable()
class CategoryCount {
  final int quizzes;

  CategoryCount({required this.quizzes});

  factory CategoryCount.fromJson(Map<String, dynamic> json) =>
      _$CategoryCountFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryCountToJson(this);
}
