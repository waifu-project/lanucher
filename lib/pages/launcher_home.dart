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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lanucher/model/item.dart';
import 'package:lanucher/provider/launcher_provider.dart';
import 'package:lanucher/widget/k_appicon.dart';
import 'package:provider/provider.dart';

import 'launcher_add_view.dart';

enum triggerCardActionType {
  /// 编辑
  edit,

  /// 删除
  del,

  /// 取消
  cancel
}

class LauncherHome extends StatefulWidget {
  const LauncherHome({Key? key}) : super(key: key);

  @override
  _LauncherHomeState createState() => _LauncherHomeState();
}

class _LauncherHomeState extends State<LauncherHome>
    with AutomaticKeepAliveClientMixin {
  handleTriggerCardAction(
    triggerCardActionType type,
    BuildContext context,
    AppItemModel item,
  ) {
    switch (type) {
      case triggerCardActionType.edit:
        return;
      case triggerCardActionType.del:
        Provider.of<LauncherNotifier>(
          context,
          listen: false,
        ).commit(
          LauncherNotifierActionType.remove,
          item,
        );
        Navigator.maybePop(context);
        return;
      default:
        Navigator.maybePop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("启动器"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text("添加"),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return const LauncherAddView();
                },
              ),
            );
          },
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: CupertinoScrollbar(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 0,
              crossAxisSpacing: 3,
              childAspectRatio: 4 / 4.66,
            ),
            itemCount: Provider.of<LauncherNotifier>(context).dataLength,
            itemBuilder: (context, index) {
              var curr = Provider.of<LauncherNotifier>(context).data[index];
              return CupertinoContextMenu(
                previewBuilder: (context, animation, child) =>
                    KAppIcon(item: curr),
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text(
                      '编辑',
                    ),
                    trailingIcon: CupertinoIcons.right_chevron,
                    onPressed: () {
                      handleTriggerCardAction(
                        triggerCardActionType.edit,
                        context,
                        curr,
                      );
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: const Text(
                      '删除',
                      style: TextStyle(
                        color: CupertinoColors.systemRed,
                      ),
                    ),
                    trailingIcon: CupertinoIcons.delete_right_fill,
                    onPressed: () {
                      handleTriggerCardAction(
                        triggerCardActionType.del,
                        context,
                        curr,
                      );
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: const Text(
                      '取消',
                    ),
                    trailingIcon: CupertinoIcons.clear_thick,
                    onPressed: () {
                      handleTriggerCardAction(
                        triggerCardActionType.cancel,
                        context,
                        curr,
                      );
                    },
                  ),
                ],
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: KAppIcon(
                          item: curr,
                          height: 60,
                          iconSize: 24,
                          borderRadius: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        curr.name,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(
                    top: 12,
                    left: 6,
                    right: 6,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
