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

import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

CSWidgetStyle brightnessStyle = const CSWidgetStyle(
    icon: const Icon(Icons.brightness_medium, color: Colors.black54));

class LauncherSettings extends StatefulWidget {
  const LauncherSettings({Key? key}) : super(key: key);

  @override
  _LauncherSettingsState createState() => _LauncherSettingsState();
}

class _LauncherSettingsState extends State<LauncherSettings> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("设置"),
      ),
      child: CupertinoSettings(
        items: <Widget>[
          const CSHeader('Brightness'),
          CSWidget(
              CupertinoSlider(
                value: 0.5,
                onChanged: (value) {},
              ),
              style: brightnessStyle),
          CSControl(
            nameWidget: const Text('Auto brightness'),
            contentWidget: CupertinoSwitch(
              value: true,
              onChanged: (bool value) {},
            ),
            style: brightnessStyle,
          ),
          const CSHeader('Selection'),
          CSSelection<int>(
            items: const <CSSelectionItem<int>>[
              CSSelectionItem<int>(text: 'Day mode', value: 0),
              CSSelectionItem<int>(text: 'Night mode', value: 1),
            ],
            onSelected: (index) {
              print(index);
            },
            currentSelection: 0,
          ),
          const CSDescription(
            'Using Night mode extends battery life on devices with OLED display',
          ),
          const CSHeader(''),
          CSControl(
            nameWidget: const Text('Loading...'),
            contentWidget: const CupertinoActivityIndicator(),
          ),
          CSButton(CSButtonType.DEFAULT, "Licenses", () {
            debugPrint("It works!");
          }),
          const CSHeader(''),
          CSButton(
            CSButtonType.DESTRUCTIVE,
            "Delete all data",
            () {},
          ),
        ],
      ),
    );
  }
}
