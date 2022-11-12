import 'package:ceiba/ui/platform/ceiba.module.dart';
import 'package:ceiba/ui/platform/router.model.dart';
import 'package:ceiba/ui/posts/posts.screen.dart';

class PostModule extends CeibaViewModule {
  @override
  List<CeibaRoute> routes() {
    return [
      CeibaRoute('posts', (s) => (_) => PostListScreen( s.arguments as PostParams ) )
    ];
  }
}