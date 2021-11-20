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
import 'package:lanucher/widget/k_app.dart';

class LauncherHome extends StatefulWidget {
  const LauncherHome({Key? key}) : super(key: key);

  @override
  _LauncherHomeState createState() => _LauncherHomeState();
}

class _LauncherHomeState extends State<LauncherHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("启动器"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text("添加"),
          onPressed: () {},
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
              childAspectRatio: 4 / 5.66,
            ),
            itemBuilder: (context, index) {
              return Container(
                child: const KApp(),
                margin: const EdgeInsets.only(
                  top: 12,
                  left: 6,
                  right: 6,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
