import 'package:flutter/material.dart';
import 'package:movie/home/home_page/widgets/trend_movies/widgets/rating_container.dart';

class MovieChildWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String imgPath;
  final String rating;
  final double top;
  final double left;
  const MovieChildWidget({super.key, required this.onPress, required this.imgPath, required this.rating, required this.top, required this.left});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imgPath,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress == null){
                    return child;
                  }
                  return SizedBox();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);
                },
              ),
            ),
            Positioned(
                top:top,
                left:left,
                child: RatingContainer(rating: rating)
            ),
          ],
        ),
      ),
    );
  }
}
