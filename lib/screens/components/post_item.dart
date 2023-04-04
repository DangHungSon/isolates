import 'package:flutter/material.dart';
import 'package:isolates/model/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final Function()? selectedPost;
  const PostItem({Key? key, required this.post, this.selectedPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedPost,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Post id:  ${post.id}'),
              Text('User id:  ${post.userId}'),
              Text('Title:  ${post.title}'),
              Text('Completed:  ${post.completed}'),
            ],
          ),
        ),
    );
  }
}
