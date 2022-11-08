import 'package:equatable/equatable.dart';
import 'package:find_pet/features/list_animals/domain/entities/list_animals_entity.dart';

class ListAnimalsPageEntity extends Equatable {
  const ListAnimalsPageEntity({
    required this.resultList,
    required this.page,
    required this.isLastPage,
    required this.resultLength,
  });

  final List<ListAnimalsEntity> resultList;
  final int page;
  final bool isLastPage;
  final int resultLength;

  @override
  List<Object?> get props => [];
}
