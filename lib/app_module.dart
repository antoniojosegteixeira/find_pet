import 'package:find_pet/features/choose_service/choose_service_module.dart';
import 'package:find_pet/features/list_animals/search_animals_module.dart';
import 'package:find_pet/features/login/login_module.dart';
import 'package:find_pet/features/post_animal/post_animal_module.dart';
import 'package:find_pet/features/profile/profile_module.dart';
import 'package:find_pet/features/register/register_module.dart';
import 'package:find_pet/features/user_posts/user_posts_module.dart';
import 'package:find_pet/features/welcome/welcome_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute<dynamic>(
          '/',
          module: WelcomeModule(),
        ),
        ModuleRoute<dynamic>('/register/', module: RegisterModule()),
        ModuleRoute<dynamic>('/login/', module: LoginModule()),
        ModuleRoute<dynamic>('/choose-service/', module: ChooseServiceModule()),
        ModuleRoute<dynamic>('/search-animals/', module: SearchAnimalsModule()),
        ModuleRoute<dynamic>('/post-animal/', module: PostAnimalModule()),
        ModuleRoute<dynamic>('/profile/', module: ProfileModule()),
        ModuleRoute<dynamic>('/user-posts/', module: UserPostsModule()),
      ];
}
