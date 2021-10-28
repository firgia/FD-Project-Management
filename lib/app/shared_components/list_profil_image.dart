import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProfilImage extends StatelessWidget {
  const ListProfilImage({
    required this.images,
    this.onPressed,
    this.maxImages = 3,
    Key? key,
  }) : super(key: key);

  final List<ImageProvider> images;

  final Function()? onPressed;
  final int maxImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: _getLimitImage(images, maxImages)
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(right: (e.key * 25.0)),
              child: _image(
                e.value,
                onPressed: onPressed,
              ),
            ),
          )
          .toList(),
    );
  }

  List<ImageProvider> _getLimitImage(List<ImageProvider> images, int limit) {
    if (images.length <= limit) {
      return images;
    } else {
      List<ImageProvider> result = [];
      for (int i = 0; i < limit; i++) {
        result.add(images[i]);
      }
      return result;
    }
  }

  Widget _image(ImageProvider image, {Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(Get.context!).cardColor,
        ),
        child: CircleAvatar(
          backgroundImage: image,
          radius: 15,
        ),
      ),
    );
  }
}
