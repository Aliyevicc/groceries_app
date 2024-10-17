import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {
  final String title;
  final bool isShowSeeAllButton;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const SectionView(
      {super.key,
      required this.title,
      required this.isShowSeeAllButton,
      required this.onPressed, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
