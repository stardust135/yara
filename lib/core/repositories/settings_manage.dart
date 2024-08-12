import 'package:hive/hive.dart';

class SettingsManager {
  final String boxName = 'appSettings';
  late Box box;
  late bool messageShouldBePined;
  late bool messageShouldBeSigned;


  initValues() async {
    box = await Hive.openBox(boxName);
    messageShouldBePined = box.get('messageShouldBePined') ?? false;
    messageShouldBeSigned = box.get('messageShouldBeSigned') ?? false;
  }
  setMessagePinState(bool value) {
    box.put('messageShouldBePined', value);
    messageShouldBePined = value;
  }

  setMessageSignState(bool value) {
    box.put('messageShouldBeSigned', value);
    messageShouldBeSigned = value;
  }

}
