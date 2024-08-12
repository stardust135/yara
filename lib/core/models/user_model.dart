import 'package:yara/core/models/app_model.dart';

class UserModel extends AppModel {
  Data? data;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Admin? admin;
  String? token;
  String? tokenType;

  Data({this.admin, this.token, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class Admin {
  int? id;
  String? firstname;
  String? lastname;
  String? socialUsername;
  String? phone;
  String? phoneVerifiedAt;
  String? lastView;
  int? isActive;
  String? userType;
  int? socialId;
  String? createdAt;
  String? updatedAt;
  String? image;

  Admin(
      {this.id,
      this.firstname,
      this.lastname,
      this.socialUsername,
      this.phone,
      this.phoneVerifiedAt,
      this.lastView,
      this.isActive,
      this.userType,
      this.socialId,
      this.createdAt,
      this.updatedAt,
      this.image});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    socialUsername = json['social_username'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    lastView = json['last_view'];
    isActive = json['is_active'];
    userType = json['user_type'];
    socialId = json['social_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['social_username'] = socialUsername;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['last_view'] = lastView;
    data['is_active'] = isActive;
    data['user_type'] = userType;
    data['social_id'] = socialId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    return data;
  }
}
