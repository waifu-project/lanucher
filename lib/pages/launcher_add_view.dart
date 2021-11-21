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

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';

import 'launcher_add_custom.dart';

/// 添加类型
enum LauncherAddType {
  /// 系统应用与设置
  system,

  /// 启动应用
  app,

  /// 自定义
  diy,
}

class LauncherAddView extends StatelessWidget {
  const LauncherAddView({Key? key}) : super(key: key);

  handleTapAdd(LauncherAddType type, BuildContext context) {
    switch (type) {
      case LauncherAddType.diy:
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return const LauncherAddCustom();
            },
          ),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: "返回",
        middle: Text("选择类别"),
      ),
      child: CupertinoScrollbar(
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            CupertinoListTile(
              title: const Text('系统应用与设置'),
              onTap: () {
                handleTapAdd(LauncherAddType.system, context);
              },
            ),
            CupertinoListTile(
              title: const Text('启动应用'),
              onTap: () {
                handleTapAdd(LauncherAddType.app, context);
              },
            ),
            CupertinoListTile(
              title: const Text('自定义'),
              onTap: () {
                handleTapAdd(LauncherAddType.diy, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
