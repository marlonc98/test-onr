import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_rappi/utils/images_constants.dart';

class ImageNetworkWithLoadWidget extends StatelessWidget {
  final String imageUrl;
  final XFile? file;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String? defaultImage;

  const ImageNetworkWithLoadWidget(
    this.imageUrl, {
    super.key,
    this.height,
    this.file,
    this.width,
    this.defaultImage,
    this.fit = BoxFit.cover,
  });

  _isWeb() {
    return imageUrl.startsWith('http') || imageUrl.startsWith('https');
  }

  _isLocal() {
    return imageUrl.startsWith('assets/') ||
        imageUrl.startsWith('file:') ||
        imageUrl.startsWith('blob:');
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && _isLocal() && file != null) {
      //load image from file
      return FutureBuilder<Uint8List>(
        future: file!.readAsBytes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Image.memory(
              snapshot.data!,
              fit: fit,
              width: width,
              height: height,
              errorBuilder: (context, error, stackTrace) {
                if (defaultImage != null) {
                  return Image.asset(
                    defaultImage!,
                    height: height ?? 250,
                    fit: fit,
                    width: width ?? double.infinity,
                  );
                }
                return SvgPicture.asset(
                  ImagesConstants.imageNotFound,
                  height: height ?? 250,
                  fit: fit,
                  width: width ?? double.infinity,
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    }
    return Image(
      image: _isWeb()
          ? NetworkImage(imageUrl)
          : (_isLocal() ? AssetImage(imageUrl) : FileImage(File(imageUrl))),
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        if (defaultImage != null) {
          return Image.asset(
            defaultImage!,
            height: height ?? 250,
            fit: fit,
            width: width ?? double.infinity,
          );
        }
        return SvgPicture.asset(
          ImagesConstants.imageNotFound,
          height: height ?? 250,
          fit: fit,
          width: width ?? double.infinity,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
            height: height,
            width: width,
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}
