import '../../domain/storage.domain.dart';
import '../dto/user.dto.dart';
import '../services/db.service.dart';

class UserRepo implements IStorage {
  UserRepo({
    DBService? service,
  }) : _service = service ?? DBService();

  final DBService _service;

  final String _table = "user_table";

  @override
  Future<List<User>> fetchAll({Map<String, dynamic>? params}) async {
    var res = await _service.fetchAll(_table);
    var userDTOs = res.map((uDTO) => UserDTO.fromJson(uDTO)).toList();
    var users = <User>[];
    for (var userDTO in userDTOs) {
      users.add(User(
        id: userDTO.id,
        firstName: userDTO.firstName,
        lastName: userDTO.lastName,
        email: userDTO.email,
        phone: userDTO.phone,
        password: userDTO.password,
      ));
    }
    return users;
  }

  @override
  Future<User> read({Map<String, dynamic>? params}) async {
    var res = await _service.read(_table, id: params!["uid"] as int);
    var userDTO = UserDTO.fromJson(res);
    return User(
      id: userDTO.id,
      firstName: userDTO.firstName,
      lastName: userDTO.lastName,
      email: userDTO.email,
      phone: userDTO.phone,
      password: userDTO.password,
    );
  }

  @override
  Future<int> insert({Map<String, dynamic>? params}) async {
    var user = params!["user"] as User;
    return await _service.insert(
      _table,
      values: UserDTO(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phone: user.phone,
        password: user.password,
        createdAt: DateTime.now().toLocal().toIso8601String(),
      ).toJson(),
    );
  }

  @override
  Future<int> update({Map<String, dynamic>? params}) async {
    var user = params!["user"] as User;
    return await _service.update(
      _table,
      values: UserDTO(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phone: user.phone,
        password: user.password,
        updatedAt: DateTime.now().toLocal().toIso8601String(),
      ).toJson(),
    );
  }

  @override
  Future<int> delete({Map<String, dynamic>? params}) async {
    return await _service.delete(_table, id: params!["uid"] as int);
  }
}
