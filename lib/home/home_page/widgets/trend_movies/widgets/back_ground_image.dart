import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  final String imgPath;
  const BackGroundImage({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgPath,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );


    //   Image.network(imgPath,fit:BoxFit.fill ,width: double.infinity,
    //   loadingBuilder: (context, child, loadingProgress) {
    //     if(loadingProgress == null){
    //       return child;
    //     }
    //     return Center(child: CircularProgressIndicator(),);
    //   },
    //   errorBuilder: (context, error, stackTrace) {
    //     return const Icon(Icons.broken_image);
    //   },
    // );
  }
}
