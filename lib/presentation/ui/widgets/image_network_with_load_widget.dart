import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_onr/utils/images_constants.dart';

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
    this.defaultImage = "assets/images/not_found.png",
    this.fit = BoxFit.cover,
  });

  bool _isWeb() {
    return imageUrl.startsWith('http') || imageUrl.startsWith('https');
  }

  bool _isLocal() {
    return imageUrl.startsWith('assets/') ||
        imageUrl.startsWith('file:') ||
        imageUrl.startsWith('blob:');
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && _isLocal() && file != null) {
      // Load image from file
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
                return _buildErrorImage();
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    }

    ImageProvider imageProvider;
    if (_isWeb()) {
      try {
        imageProvider = NetworkImage(imageUrl);
      } catch (e) {
        return _buildErrorImage();
      }
    } else if (_isLocal()) {
      imageProvider = AssetImage(imageUrl) as ImageProvider;
    } else {
      imageProvider = FileImage(File(imageUrl));
    }

    return Image(
      image: imageProvider,
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorImage();
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
          ),
        );
      },
    );
  }

  Widget _buildErrorImage() {
    // return Image.asset()
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
  }
}
