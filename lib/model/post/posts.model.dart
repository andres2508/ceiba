import 'package:json_annotation/json_annotation.dart';

part 'posts.model.g.dart';

@JsonSerializable()
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}