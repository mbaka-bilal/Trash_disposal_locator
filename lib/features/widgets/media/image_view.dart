/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
Description: Widget to display images
*/

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/extensions/string_extensions.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.image,
    this.boxFit = BoxFit.cover,
    this.bytes,
    this.width,
    this.color,
    this.height,
    this.borderRadius,
  });

  final String image;
  final Uint8List? bytes;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final Color? color;
  final double? borderRadius;

  Widget _child() {
    if (bytes != null) {
      return Image.memory(
        bytes!,
        fit: boxFit,
        width: width,
        height: height,
        color: color,
      );
    }

    if (image.isLottie) {
      return Lottie.asset(image, width: width, height: height, fit: boxFit);
    }

    if (image.isRemote) {
      return Image.network(
        image,
        fit: boxFit,
        width: width,
        height: height,
        color: color,
      );
    }

    if (image.isAnAsset) {
      if (image.isSvg) {
        return SvgPicture.asset(
          image,
          fit: boxFit,
          width: width,
          height: height,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(color!, BlendMode.srcIn),
        );
      } else {
        return Image.asset(
          image,
          fit: boxFit,
          width: width,
          height: height,
          color: color,
        );
      }
    }

    //Assume it is a file
    return Image.file(File(image), fit: boxFit, width: width, height: height);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: _child(),
    );
  }
}
