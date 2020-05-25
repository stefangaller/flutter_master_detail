import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_detail/bloc/bloc.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  MasterDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MasterDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadedItemsState) {
            return Center(
              child: Text(state.selectedElement?.detail ?? "No item selected"),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
