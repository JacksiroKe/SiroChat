import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../exports.dart';

class PhotoScreen extends StatelessWidget {
  final String url;

  const PhotoScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.fullPhotoTitle,
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
