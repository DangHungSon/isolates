import 'package:flutter/material.dart';
import 'package:isolates/model/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('${post.id}'),
            Text('${post.userId}'),
            Text('${post.title}'),
            Text('${post.completed}'),
          ],
        ),
      );
  }
}
