import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:isolates/model/post_model.dart';
import 'package:isolates/screens/components/posts_item.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<PostModel> posts = [];

  Future<List<PostModel>> getData() async {
    final dio = Dio();
    var response = await dio.get('https://jsonplaceholder.typicode.com/todos');
    Iterable listPost = response.data;
    posts.addAll(listPost.map((e) => PostModel.fromJson(e)).toList());
    return posts;
  }

  getPosts() async {
    await getData();
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.backspace),
            ),
          ),
          body: Column(
            children: [
              _buildUI(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        return Expanded(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostItem(
                  post: posts[index],
                );
              }),
        );
      },
    );
  }
}
