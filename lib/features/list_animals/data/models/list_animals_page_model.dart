import 'package:find_pet/features/list_animals/data/models/list_animals_model.dart';
import 'package:find_pet/features/list_animals/domain/entities/list_animals_page_entity.dart';

class ListAnimalsPageModel extends ListAnimalsPageEntity {
  const ListAnimalsPageModel({
    required super.resultList,
    required super.page,
    required super.isLastPage,
    required super.resultLength,
  });

  factory ListAnimalsPageModel.fromJson(Map<String, dynamic> json) {
    return ListAnimalsPageModel(
      resultList: List<ListAnimalsModel>.from(
          json['resultList'].map((value) => ListAnimalsModel.fromJson(value))),
      page: json['page'] as int,
      resultLength: json['result-length'] as int,
      isLastPage: json['is-last-page'] as bool,
    );
  }
}
