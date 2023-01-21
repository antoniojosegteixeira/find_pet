import 'package:find_pet/features/login/data/models/user_model.dart';
import 'package:find_pet/features/login/domain/entities/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

const emptyUserModel = UserModel(
  id: '',
  email: '',
  username: '',
  city: '',
  state: '',
  country: '',
  sessionToken: '',
  refreshToken: '',
);

class SessionService {
  SessionService._();

  static late Box sessionBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserEntityAdapter());

    sessionBox = await Hive.openBox<UserModel>('sessionBox');

    sessionRegister(emptyUserModel);
  }

  static void sessionRegister(UserModel user) {
    sessionBox.put(
      'session',
      user,
    );
  }

  static bool logout() {
    sessionRegister(emptyUserModel);
    return false;
  }

  static UserModel getSession() {
    return sessionBox.get('session') as UserModel;
  }

  static bool isLogged() {
    return getSession().id.isNotEmpty;
  }
}
