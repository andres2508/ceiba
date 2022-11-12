import 'package:ceiba/model/post/posts.model.dart';
import 'package:ceiba/styles/color.styles.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post _post;
  const PostTile(this._post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 8 ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all( Radius.circular( 5 ) ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 1
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this._post.title,
            style: const TextStyle(
              fontSize: 15,
              color: ColorStyles.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top: 10 ),
            child: Text( _post.body ),
          )
        ],
      ),
    );
  }
}
