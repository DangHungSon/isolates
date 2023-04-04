import 'package:flutter/material.dart';
import 'package:isolates/model/post_model.dart';
import 'package:isolates/screens/components/post_detail.dart';
import 'package:isolates/screens/components/post_item.dart';
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
    setState(() {});
  }

  selectedPost(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostDetail(
                  post: posts[index],
                )));
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
    );
  }

  Widget _buildUI(BuildContext context) {
    return FutureBuilder(
      future: CallApi().getData(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (!snapshot.hasData) return const Center(child: Text('Loading'));
        return Expanded(
          child: ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostItem(
                post: posts[index],
                selectedPost: () => selectedPost(index),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        );
      },
    );
  }
}
