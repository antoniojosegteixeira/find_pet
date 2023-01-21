import 'package:equatable/equatable.dart';
import 'package:find_pet/core/list_animals/models/list_animals_result_model.dart';

class ListAnimalsPageEntity extends Equatable {
  const ListAnimalsPageEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<ListAnimalsResultModel> results;

  @override
  List<Object?> get props => [];
}
