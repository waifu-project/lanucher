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
import 'package:lanucher/pages/launcher_home.dart';
import 'package:lanucher/pages/launcher_note.dart';
import 'package:lanucher/pages/launcher_settings.dart';
import 'package:lanucher/provider/launcher_provider.dart';
import 'package:lanucher/provider/theme_provider.dart';
import 'package:lanucher/utils/local_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        ChangeNotifierProvider<LauncherNotifier>(
          create: (_) => LauncherNotifier(),
        ),
      ],
      builder: (context, child) {
        final notifier = context.watch<ThemeNotifier>();
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Launcher',
          theme: notifier.darkTheme ? dark : light,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _tabs = [
    const LauncherHome(),
    const LauncherNote(),
    const LauncherSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge),
            label: "启动器",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.uiwindow_split_2x1),
            label: "探索",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "设置",
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return _tabs[index];
      },
    );
  }
}
