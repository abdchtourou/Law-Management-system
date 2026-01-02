import 'package:lms/features/auth/data/models/user_model.dart';

class UserResponse {
  int? count;
  List<User>? users;

  UserResponse({this.count, this.users});

  UserResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
