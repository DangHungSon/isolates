import 'package:flutter/material.dart';
import 'package:isolates/model/post_model.dart';

class PostDetail extends StatefulWidget {

  final PostModel post;
  
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.backspace),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Post id:  ${widget.post.id}'),
              Text('User id:  ${widget.post.userId}'),
              Text('Title:  ${widget.post.title}'),
              Text('Completed:  ${widget.post.completed}'),
            ],
          ),
        ),
      ),
    );
  }
}
