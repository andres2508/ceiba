import 'package:ceiba/model/post/posts.model.dart';
import 'package:ceiba/model/user/users.model.dart';
import 'package:ceiba/styles/color.styles.dart';
import 'package:ceiba/ui/common/future_wrapper.widget.dart';
import 'package:ceiba/ui/common/view.model.consumer.dart';
import 'package:ceiba/ui/posts/posts.tile.widget.dart';
import 'package:ceiba/ui/posts/posts.view.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostParams {
  final User user;
  PostParams.from(this.user);
}

class PostListScreen extends StatefulWidget {
  final PostParams params;
  const PostListScreen(this.params, {Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final PostViewModel _model = PostViewModel();

  get user => this.widget.params.user;

  Future<void> _loadPosts() async {
    await this._model.loadPosts( this.widget.params.user );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publicaciones"),
      ),
      body: FutureWrapperWidget(
        future: _loadPosts,
        builder: (context, snapshot) {
          return ChangeNotifierProvider<PostViewModel>(
            create: (_) => this._model,
            child: Container(
              padding: EdgeInsets.all( 10 ),
              child: Column(
                children: [
                  _userHead(),
                  _postDetail()
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _userHead() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only( bottom: 15 ),
          child: Text( this.user.name,
            style: const TextStyle(
              fontSize: 18,
              color: ColorStyles.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Icon( Icons.phone, color: ColorStyles.accentColor, ),
            Padding(
              padding: const EdgeInsets.only( left: 10 ),
              child: Text( this.user.phone ),
            )
          ],
        ),
        Row(
          children: [
            Icon( Icons.mail, color: ColorStyles.accentColor, ),
            Padding(
              padding: const EdgeInsets.only( left: 10 ),
              child: Text( this.user.email ),
            )
          ],
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only( top: 20 ),
            child: Text( 'Publicaciones:',
              style: TextStyle(
                fontSize: 18,
                color: ColorStyles.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider()
      ],
    );
  }

  Widget _postDetail() {
    return ViewModelConsumer<PostViewModel>(
      builder: (context, model, _) {
        return Expanded(
            child: ListView.separated (
              padding: EdgeInsets.all(5),
              itemBuilder: (_, index) {
                Post post = model.posts[index];
                return PostTile( post, key: UniqueKey() );
              },
              itemCount: model.posts.length,
              separatorBuilder: (_, index) => const SizedBox( height: 15 )
          )
        );
      }
    );
  }
}
