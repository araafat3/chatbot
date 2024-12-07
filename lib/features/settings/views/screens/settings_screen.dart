import 'package:chatbot/core/application/listener/theme_listener.dart';
import 'package:chatbot/core/helper/app_navigator.dart';
import 'package:chatbot/features/settings/view_model/settings_view_model.dart';
import 'package:chatbot/features/settings/views/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget with SettingViewModel{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 40.0),

                Consumer<ThemeListener>(
                    builder: (context, value, child) {
                    return SettingsTile(
                        icon: value.isDarkMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        title: 'Theme',
                        value: value.isDarkMode,
                        onChanged: (value) =>changeTheme());
                  }
                ),
              ],
            ),
          ),
        ));
  }
}
