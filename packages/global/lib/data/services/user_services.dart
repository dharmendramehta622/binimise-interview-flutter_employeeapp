part of global;

// import 'package:global/global.dart';

class Users {
  deleteUrl(String id) => '/users/$id/';
  singleUserUrl(String id) => '/users/$id/';
  updateUrl(String id) => '/users/$id/';
  Future<Iterable<UsersModel>> getAllUsers() async {
    final res = await ApiModel.instance.get(
      url: '/users/',
    );
    if (res.status) {
      return (res.msg!.data as List).map((e) => UsersModel.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  Future<UsersModel> getIndividualUser(UsersModel model) async {
    final res = await ApiModel.instance.get(
      url: singleUserUrl(model.id ?? ''),
    );
    if (res.status) {
      return UsersModel.fromMap(res.msg!.data);
    } else {
      return UsersModel();
    }
  }

  Future<ApiResponse> addUsers(UsersModel model) async {
    var data = {
      "firstName": "${model.firstName}",
      "lastName": "${model.lastName}",
      "email": "${model.email}",
      "password": "${model.password}",
      "phone": "${model.phone}"
    };
    final res = await ApiModel.instance.post(url: '/users/', variables: data);

    return res;
  }

  Future<ApiResponse> updateUsers(UsersModel model) async {
    var data = {
      "firstName": "${model.firstName}",
      "lastName": "${model.lastName}",
      "email": "${model.email}",
      "phone": "${model.phone}"
    };
    final res = await ApiModel.instance
        .put(url: updateUrl(model.id ?? ""), variables: data);

    return res;
  }

  Future<ApiResponse> deleteUser(UsersModel model) async {
    final res = await ApiModel.instance.delete(url: deleteUrl(model.id ?? ''));
    print(res.toString());
    return res;
  }
}
