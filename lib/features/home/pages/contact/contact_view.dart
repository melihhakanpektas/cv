import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final ScrollController scrollController;
  const ContactView(
    this.scrollController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Container(),
    );
  }
}
