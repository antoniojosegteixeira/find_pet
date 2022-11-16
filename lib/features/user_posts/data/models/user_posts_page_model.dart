import 'package:find_pet/features/user_posts/data/models/user_posts_result_model.dart';
import 'package:find_pet/features/user_posts/domain/entities/user_posts_page_entity.dart';

class UserPostsPageModel extends UserPostsPageEntity {
  const UserPostsPageModel({
    required super.count,
    super.next,
    super.previous,
    required super.results,
  });

  factory UserPostsPageModel.fromJson(Map<String, dynamic> json) =>
      UserPostsPageModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<UserPostsResultModel>.from(
            json["results"].map((x) => UserPostsResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
