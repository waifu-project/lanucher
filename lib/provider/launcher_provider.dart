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

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:lanucher/model/item.dart';
import 'package:lanucher/utils/local_storage.dart';

enum LauncherNotifierActionType {
  /// 添加
  add,

  /// 删除
  remove,

  /// 清除
  clean,
}

class LauncherNotifier extends ChangeNotifier {
  final String key = "launcher_data";

  late List<AppItemModel> _data;

  List<AppItemModel> get data => _data;

  LauncherNotifier() {
    loadLocalData();
  }

  loadLocalData() {
    List<AppItemModel> _cacheData = LocalStorage.getStringList(key)
        .map(
          (e) => appItemModelFromJson(e),
        )
        .toList();
    _data = _cacheData;
    notifyListeners();
  }

  Future<bool> _save2Local() async {
    return await LocalStorage.setStringList(
      key,
      _data.map((e) => appItemModelToJson(e)).toList(),
    );
  }

  int get dataLength => _data.length;

  commit(LauncherNotifierActionType type, [AppItemModel? payload]) {
    switch (type) {
      case LauncherNotifierActionType.add:
        if (payload != null) _data.add(payload);
        break;
      case LauncherNotifierActionType.remove:
        if (payload != null) _data.remove(payload);
        break;
      default:
        _data = [];
    }
    _save2Local();
    notifyListeners();
  }
}
