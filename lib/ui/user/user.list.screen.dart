import 'package:ceiba/model/user/users.model.dart';
import 'package:ceiba/ui/common/future_wrapper.widget.dart';
import 'package:ceiba/ui/common/view.model.consumer.dart';
import 'package:ceiba/ui/user/user.tile.widget.dart';
import 'package:ceiba/ui/user/user.view.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserViewModel _model = UserViewModel();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadModel() async {
    await this._model.loadList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (_) => this._model,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          children: [
            _searchWidget(),
            FutureWrapperWidget(
              future: _loadModel,
              builder: (context, snapshot) => Expanded(child: _listView()),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchWidget() {
    return Padding(
      padding: const EdgeInsets.only( bottom: 20, right: 5, left: 5 ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Buscar Usuario'
        ),
        onChanged: (text) => _model.search( text ),
      ),
    );
  }

  Widget _listView() {
    return ViewModelConsumer<UserViewModel>(
      builder: (context, model, _) {
        return ListView.separated(
          padding: EdgeInsets.all(5),
          itemBuilder: (_, index) {
            User user = model.usersFiltered[index];
            return UserTile( user, key: UniqueKey(), );
          },
          itemCount: model.usersFiltered.length,
          separatorBuilder: (_, int index) => const SizedBox(height: 20,),
        );
      },
    );
  }
}
