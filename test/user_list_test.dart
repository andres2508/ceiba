import 'package:ceiba/infrastructure/locator/service.locator.dart';
import 'package:ceiba/model/user/users.model.dart';
import 'package:ceiba/ui/user/user.service.dart';
import 'package:ceiba/ui/user/user.view.model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_list_test.mocks.dart';

@GenerateMocks([UserService])
void main() {
  // Required mocks for test
  setupServiceLocator();
  final mockService = MockUserService();
  final userTest = User(1, 'Test', 'test', 'test@test.co',
      Address('street', 'suite', 'city', 'zipcode', Geolocation('0.0', '0.0')),
      '3333333', 'test.com', Company('testCompany', 'catchPhrase', 'bs'));
  when( mockService.findAll() ).thenAnswer((_) async => [userTest] );
  // Then load users
  test('Load user list', () async {
    when( mockService.findAll() ).thenAnswer((_) async => [userTest] );
    final model = UserViewModel();
    await model.loadList( mockService );
    expect( model.usersFiltered.length, equals( 1 ) );
  });
  // Test filtered users
  test('Filtered users by text coincidences', () async {
    final model = UserViewModel();
    await model.loadList( mockService );

    model.filteredBySearchText('nothing');
    expect( model.usersFiltered.length, equals(0));
  });
}
