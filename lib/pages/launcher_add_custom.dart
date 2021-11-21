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
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'add_custom_modal.dart';

class LauncherAddCustom extends StatefulWidget {
  const LauncherAddCustom({Key? key}) : super(key: key);

  @override
  _LauncherAddCustomState createState() => _LauncherAddCustomState();
}

class _LauncherAddCustomState extends State<LauncherAddCustom> {
  bool get canAdd => true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: "返回",
        middle: Text("自定义"),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: CSHeader("添加一条启动器"),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color:
                          CupertinoColors.opaqueSeparator.resolveFrom(context),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            builder: (context) => LauncherAddCustomModal(),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: CupertinoColors.activeBlue,
                            ),
                            width: 66,
                            height: 66,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            CupertinoTextField(
                              placeholder: "名称",
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: CupertinoColors.opaqueSeparator
                                        .resolveFrom(context),
                                  ),
                                ),
                              ),
                            ),
                            const CupertinoTextField(
                              placeholder: "链接",
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                ),
                child: Text(
                  "创建或更新启动项需要设置名字、链接、图标，点击图标可以更换或设置",
                  style: basicTextStyle(context).copyWith(
                    color: CupertinoColors.secondaryLabel.resolveFrom(
                      context,
                    ),
                    fontSize: CS_HEADER_FONT_SIZE,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                child: Text(
                  "添加",
                  style: TextStyle(
                    color: canAdd
                        ? CupertinoTheme.of(context).primaryColor
                        : CupertinoColors.black.withOpacity(
                            .2,
                          ),
                  ),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  border: Border(
                    top: BorderSide(
                      color:
                          CupertinoColors.opaqueSeparator.resolveFrom(context),
                    ),
                    bottom: BorderSide(
                      color:
                          CupertinoColors.opaqueSeparator.resolveFrom(context),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 10.0,
                  bottom: 12,
                  top: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
