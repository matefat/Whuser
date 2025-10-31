import 'package:whuser/models/user_model.dart';

abstract class UserRepository {
  Future<User> fetchAndPersist();
  List<User> getAllPersisted();
  Future<void> save(User user);
  Future<void> remove(String id);
  bool exists(String id);
}