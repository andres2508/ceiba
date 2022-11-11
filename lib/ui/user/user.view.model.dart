import 'package:ceiba/infrastructure/locator/service.locator.dart';
import 'package:ceiba/model/user/user.repository.dart';
import 'package:ceiba/model/user/users.model.dart';
import 'package:ceiba/ui/common/base.view.model.dart';
import 'package:ceiba/ui/user/user.service.dart';

class UserViewModel extends BaseViewModel {
  final UserService _service = serviceLocator<UserService>();
  final UserRepository _repository = UserRepository.repository;
  List<User> _users = [];
  List<User> _filtered = [];

  get usersFiltered => _filtered;

  Future<void> loadList() async {
    _users = await _repository.findAll();
    if ( _users.isEmpty ) {
      this._users = await this._service.findAll();
      _saveUsers();
    }
    this._filtered = this._users;
    notifyUI();
    notifyListeners();
  }

  _saveUsers() async {
    for( var user in _users ) {
      await _repository.save( user );
    }
  }

  search(String text) {
    if ( text == '' || text == null) {
      this._filtered = this._users;
    } else {
      this._filtered = [];
      for ( User user in this._users ) {
        if ( user.name.toLowerCase().contains( text.toLowerCase() ) ) {
          this._filtered.add( user );
        }
      }
    }
    notifyUI();
    notifyListeners();
  }
}