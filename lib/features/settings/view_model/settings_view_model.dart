import 'package:chatbot/core/application/listener/theme_listener.dart';
import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:provider/provider.dart';

mixin class SettingViewModel{
  changeTheme(){
    AppNavigator().currentContext().read<ThemeListener>().toggleTheme(
        isOn: !ThemeListener().isDarkMode
    );
  }
}