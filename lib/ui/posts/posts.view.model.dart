import 'package:ceiba/infrastructure/locator/service.locator.dart';
import 'package:ceiba/model/post/posts.model.dart';
import 'package:ceiba/model/user/users.model.dart';
import 'package:ceiba/ui/common/base.view.model.dart';
import 'package:ceiba/ui/posts/posts.service.dart';

class PostViewModel extends BaseViewModel {
  final PostService _service = serviceLocator<PostService>();

  List<Post> _posts = [];
  late User _currentUser;

  get user => _currentUser;
  get posts => _posts;

  Future<void> loadPosts(User user) async {
    this._posts = await this._service.findByUser( user.id );
    this._currentUser = user;
    notifyUI();
    notifyListeners();
  }
}