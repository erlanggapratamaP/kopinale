import 'category.dart';

class CategoryReponseModel {
  String? message;
  List<Category>? data;

  CategoryReponseModel({this.message, this.data});

  @override
  String toString() => 'Category(message: $message, data: $data)';

  factory CategoryReponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryReponseModel(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  CategoryReponseModel copyWith({
    String? message,
    List<Category>? data,
  }) {
    return CategoryReponseModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
