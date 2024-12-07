import 'package:chatbot/core/helper/device_info_details.dart';
import 'package:chatbot/core/utils/constants/app_data.dart';
import 'package:chatbot/core/model/chat_history.dart';
import 'package:hive/hive.dart';


class LocalStorage {
  static LocalStorage? _instance;

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance ??= LocalStorage._internal();
  }

  late final Box _box;

  Future<void> init() async {
    String path = DeviceInfoDetails().appPath.path;
    Hive.init(path);
    _box = await Hive.openBox(AppData.localBox);
  }

  void putInBox({required String key, required dynamic value}) {
    _box.put(key, value);
  }

  getFromBox({required String key}) {
    return _box.get(key, defaultValue: null);
  }

  void deleteFromBox({required String key}) {
    _box.delete(key);
  }

  Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(AppData.chatHistoryBox);
}
