import 'package:flutter/material.dart';

class IndexProductView extends StatelessWidget {
  const IndexProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => Container(),
          separatorBuilder: (context, index) => Container(),
          itemCount: 4),
    );
  }
}
