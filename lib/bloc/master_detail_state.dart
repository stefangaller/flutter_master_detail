import 'package:equatable/equatable.dart';
import 'package:master_detail/data/item.dart';

abstract class MasterDetailState extends Equatable {
  const MasterDetailState();
}

class LoadingItemsState extends MasterDetailState {
  @override
  List<Object> get props => [];
}

class NoItemsState extends MasterDetailState {
  @override
  List<Object> get props => [];
}

class LoadedItemsState extends MasterDetailState {
  final List<Item> elements;
  final Item selectedElement;

  LoadedItemsState(this.elements, this.selectedElement);

  @override
  List<Object> get props => [selectedElement, ...elements];
}
