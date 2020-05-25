import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final String detail;

  Item(this.name, this.detail);

  factory Item.fromItem(Item item){
    if (item == null){
      return null;
    } else {
      return Item(item.name, item.detail);
    }
  }

  @override
  List<Object> get props => [name, detail];
}
