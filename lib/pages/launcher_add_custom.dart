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
import 'package:lanucher/model/item.dart';
import 'package:lanucher/provider/launcher_provider.dart';
import 'package:lanucher/utils/helper.dart';
import 'package:lanucher/widget/k_appicon.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'add_custom_modal.dart';

class LauncherAddCustom extends StatefulWidget {
  const LauncherAddCustom({Key? key}) : super(key: key);

  @override
  _LauncherAddCustomState createState() => _LauncherAddCustomState();
}

class _LauncherAddCustomState extends State<LauncherAddCustom> {
  bool get canAdd {
    return _nameText.isNotEmpty && _linkText.isNotEmpty && isURL(_linkText);
  }

  int _currentCupertinoIconIndex = 0;
  int _curerntGradientsIndex = 0;

  final TextEditingController _name = TextEditingController();

  final TextEditingController _link = TextEditingController();

  String _nameText = "";
  String _linkText = "";

  String _icon = "";

  AppItemModelIconType _appType = AppItemModelIconType.custom;

  AppItemModel get appData => AppItemModel(
        bgIndex: _curerntGradientsIndex,
        iconIndex: _currentCupertinoIconIndex,
        appType: _appType,
        name: _nameText,
        appUrl: _linkText,
        appIcon: _icon,
        appId: "",
      );

  /// 尽量的获取 `logo`
  /// [_linkText]
  Future<String?> fetchLogo({String? url}) async {
    var link = _linkText;
    if (url != null) link = url;
    if (link.isEmpty) return null;
    var metaData = await MetadataFetch.extract(link);
    return metaData!.image;
  }

  previewLogoModel(BuildContext context, String logo) {
    showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                logo,
                height: 120,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton.filled(
                    child: const Text("取消"),
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CupertinoButton.filled(
                    child: const Text("使用"),
                    onPressed: () {
                      setState(() {
                        _appType = AppItemModelIconType.image;
                        _icon = logo;
                      });
                      Navigator.maybePop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  initInputTextController() {
    _name.addListener(() {
      setState(() {
        _nameText = _name.text;
      });
    });
    _link.addListener(() {
      setState(() {
        _linkText = _link.text;
      });
    });
  }

  @override
  void initState() {
    initInputTextController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _link.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var opaqueSeparatorColor =
        CupertinoColors.opaqueSeparator.resolveFrom(context);
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
                      color: opaqueSeparatorColor,
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
                        onTap: () async {
                          List<int>? result =
                              await showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            builder: (context) =>
                                const LauncherAddCustomModal(),
                          );
                          if (result == null) return;
                          setState(() {
                            _appType = AppItemModelIconType.custom;
                            _currentCupertinoIconIndex = result[0];
                            _curerntGradientsIndex = result[1];
                          });
                        },
                        child: KAppIcon(
                          width: 60,
                          height: 60,
                          iconSize: 24,
                          borderRadius: 12,
                          item: appData,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            CupertinoTextField(
                              controller: _name,
                              placeholder: "名称",
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: opaqueSeparatorColor,
                                  ),
                                ),
                              ),
                              clearButtonMode: OverlayVisibilityMode.editing,
                            ),
                            CupertinoTextField(
                              controller: _link,
                              placeholder: "链接",
                              decoration: const BoxDecoration(),
                              clearButtonMode: OverlayVisibilityMode.editing,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (!canAdd) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        child: const Text("自动抓取Logo"),
                        onPressed: () async {
                          var logo = await fetchLogo();
                          if (logo == null) return;
                          previewLogoModel(context, logo);
                        },
                      ),
                    ),
                  );
                },
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
              GestureDetector(
                onTap: () {
                  if (!canAdd) return;
                  Provider.of<LauncherNotifier>(
                    context,
                    listen: false,
                  ).commit(
                    LauncherNotifierActionType.add,
                    appData,
                  );
                },
                child: Container(
                  child: Text(
                    "添加",
                    style: TextStyle(
                      color: canAdd
                          ? CupertinoTheme.of(context).primaryColor
                          : CupertinoColors.black.withOpacity(.2),
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CupertinoTheme.of(context).barBackgroundColor,
                    border: Border(
                      top: BorderSide(
                        color: opaqueSeparatorColor,
                      ),
                      bottom: BorderSide(
                        color: opaqueSeparatorColor,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    bottom: 12,
                    top: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
