import 'package:flutter/material.dart';
import 'package:isolates/model/post_model.dart';
import 'package:isolates/screens/components/posts_item.dart';
import 'package:isolates/services/call_api.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<PostModel> posts = [];

  getPosts() async {
    var data = await CallApi().getData();
    posts.addAll(data);
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
      future: CallApi().getData(),
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
