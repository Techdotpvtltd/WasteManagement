// Project: 	   wasteapp
// File:    	   app_manager
// Path:    	   lib/manager/app_manager.dart
// Author:       Ali Akbar
// Date:        17-04-24 16:48:26 -- Wednesday
// Description:

class AppManager {
  static final AppManager _instance = AppManager._internal();
  AppManager._internal();
  factory AppManager() => _instance;

  bool isInChat = false;
}
