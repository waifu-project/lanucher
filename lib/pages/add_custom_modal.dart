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

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lanucher/data/gradients.dart';
import 'package:lanucher/data/icons.dart';
import 'package:lanucher/model/gradients_json_data/gradients_json_data.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'icon_lists.dart';

class LauncherAddCustomModal extends StatefulWidget {
  const LauncherAddCustomModal({Key? key}) : super(key: key);

  @override
  _LauncherAddCustomModalState createState() => _LauncherAddCustomModalState();
}

class _LauncherAddCustomModalState extends State<LauncherAddCustomModal> {
  @override
  void initState() {
    super.initState();
  }

  int _currentCupertinoIconIndex = 0;

  IconData get _currentIconData {
    return cupertinoIconList[_currentCupertinoIconIndex];
  }

  int _curerntGradientsIndex = 0;

  List<Color> get _currentBgColor {
    Map<String, dynamic> current = gradientsList[_curerntGradientsIndex];
    List<String> data = current["colors"];
    return [
      data[0].toColor(),
      data[1].toColor(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text("确定"),
          onPressed: () {},
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text("选取图标"),
          onPressed: () async {
            int? iconIndex = await showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              builder: (context) => const IconLists(),
            );
            if (iconIndex == null) return;
            setState(() {
              _currentCupertinoIconIndex = iconIndex;
            });
          },
        ),
        middle: const Text("图标"),
      ),
      child: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
          child: LayoutBuilder(
            builder: (context, constSize) {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: constSize.maxHeight * .6,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: AnimatedContainer(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _currentBgColor,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              _currentIconData,
                              color: CupertinoColors.white,
                              size: 82,
                            ),
                          ),
                          duration: const Duration(
                            milliseconds: 420,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CupertinoScrollbar(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(24),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> current = gradientsList[index];
                          List<String> colors = current['colors'];
                          var f1 = colors[0].toColor();
                          var f2 = colors[1].toColor();
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _curerntGradientsIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    f1,
                                    f2,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: f1.withOpacity(.3),
                                    offset: const Offset(3, 3),
                                    blurRadius: 12,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: gradientsList.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
