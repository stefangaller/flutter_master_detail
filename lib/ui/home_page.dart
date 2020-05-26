import 'package:flutter/material.dart';
import 'package:master_detail/ui/detail.dart';
import 'package:master_detail/ui/master.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return _TabletHomePage();
        } else {
          return _MobileHomePage();
        }
      },
    );
  }
}

class _MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Master();
  }
}

class _TabletHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 300, child: Master()),
        Expanded(child: Detail())
      ],
    );
  }
}
