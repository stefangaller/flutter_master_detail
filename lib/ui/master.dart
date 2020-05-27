import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_detail/bloc/bloc.dart';
import 'package:master_detail/data/item.dart';
import 'package:master_detail/ui/detail.dart';

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  int elementCount = 0;
  MasterDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.add(LoadItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Master"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _addItem)
        ],
      ),
      backgroundColor: Color(0xffefefef),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadingItemsState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NoItemsState) {
            return Center(child: Text("No Items"));
          } else if (state is LoadedItemsState) {
            return ListView.builder(
              itemCount: state.elements.length,
              itemBuilder: (context, index) {
                final item = state.elements[index];
                return ListTile(
                  title: Text(item.name),
                  selected: item == state.selectedElement,
                  onTap: () => _selectItem(context, item),
                );
              },
            );
          }
          throw Exception("unexpected state $state");
        },
      ),
    );
  }

  _addItem() {
    final newItem = Item(
      "name $elementCount",
      "This is the detail for element $elementCount",
    );
    _bloc.add(AddItemEvent(newItem));
    elementCount++;
  }

  _selectItem(BuildContext context, Item item) {
    _bloc.add(SelectItemEvent(item));
    if (MediaQuery.of(context).size.shortestSide < 768) {
      final route = MaterialPageRoute(builder: (context) => Detail());
      Navigator.push(context, route);
    }
  }
}
