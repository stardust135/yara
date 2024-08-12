import 'package:hive/hive.dart';

class DbManager {
  final String boxName = 'appDatabase';
  late Box box;
  bool? onboardingShown;
  bool? userLoggedIn;

  String? token;
  int? userId;
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

  initValues() async {
    box = await Hive.openBox(boxName);
    onboardingShown = box.get('onboardingShown');
  }

  setOnboardingShown(bool state) {
    box.put('onboardingShown', state);
    onboardingShown = state;
  }

  setLoggedIn(bool state) {
    box.put('userLoggedIn', state);
    userLoggedIn = state;
  }

  setUserInfo({
    String? token,
    int? userId,
    String? firstname,
    String? lastname,
    String? socialUsername,
    String? phone,
    String? phoneVerifiedAt,
    String? lastView,
    int? isActive,
    String? userType,
    int? socialId,
    String? createdAt,
    String? updatedAt,
    String? image,
  }) {
    this.token = token ?? this.token;
    box.put('token', this.token);

    this.userId = userId ?? this.userId;
    box.put('userId', this.userId);

    this.firstname = firstname ?? this.firstname;
    box.put('firstname', this.firstname);

    this.lastname = lastname ?? this.lastname;
    box.put('lastname', this.lastname);

    this.socialUsername = socialUsername ?? this.socialUsername;
    box.put('socialUsername', this.socialUsername);

    this.phone = phone ?? this.phone;
    box.put('phone', this.phone);

    this.phoneVerifiedAt = phoneVerifiedAt ?? this.phoneVerifiedAt;
    box.put('phoneVerifiedAt', this.phoneVerifiedAt);

    this.lastView = lastView ?? this.lastView;
    box.put('lastView', this.lastView);

    box.put('isActive', isActive ?? this.isActive);
    this.isActive = isActive ?? this.isActive;

    this.userType = userType ?? this.userType;
    box.put('userType', this.userType);

    this.socialId = socialId ?? this.socialId;
    box.put('socialId', this.socialId);

    box.put('createdAt', this.createdAt);
    this.createdAt = createdAt ?? this.createdAt;

    box.put('createdAt', this.createdAt);
    this.createdAt = createdAt ?? this.createdAt;

    box.put('updatedAt', this.updatedAt);
    this.updatedAt = updatedAt ?? this.updatedAt;

    box.put('image', this.image);
    this.image = image ?? this.image;
  }
}
