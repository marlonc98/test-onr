import 'package:flutter/material.dart';
import 'package:test_rappi/utils/images_constants.dart';

class NotReadImageWidget extends StatelessWidget {
  final double? height;
  const NotReadImageWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Image.asset(
        ImagesConstants.imageNotFound,
        height: height ?? 250,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
