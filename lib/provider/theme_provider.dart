// Copyright (C) 2021 d1y <chenhonzhou@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// code copy by: https://github.com/Amilcar-Paco/flutter_theme_switcher/blob/master/lib/view/settings.dart

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

CupertinoThemeData light = const CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.systemBlue,
);

CupertinoThemeData dark = const CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: CupertinoColors.systemPink,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences _pref;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}
