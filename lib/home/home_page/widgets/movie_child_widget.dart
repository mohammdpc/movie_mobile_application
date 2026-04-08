import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/home/home_page/widgets/trend_movies/widgets/rating_container.dart';

class MovieChildWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String imgPath;
  final String rating;
  final double top;
  final double left;
  final double borderRadius;

  const MovieChildWidget({
    super.key,
    required this.onPress,
    required this.imgPath,
    required this.rating,
    required this.top,
    required this.left,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imgPath,
          // Shows while loading
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          // Shows if the image fails to load
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
          // ONLY builds when the image is fully loaded and ready
          imageBuilder: (context, imageProvider) {
            return GestureDetector(
              onTap: onPress,
              child: Stack(
                children: [
                  // The actual loaded image
                  Image(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                  // The rating container overlays the image
                  Positioned(
                    top: top,
                    left: left,
                    child: RatingContainer(rating: rating),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}