import 'package:ceiba/infrastructure/http/http.data_source.dart';
import 'package:ceiba/model/user/users.model.dart';

class UserService extends HttpDataSource {
  UserService():
      super('/users');

  Future<List<User>> findAll() {
    return this.getList('', (json) => User.fromJson(json));
  }
}