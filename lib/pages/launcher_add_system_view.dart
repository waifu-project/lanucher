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

class LauncherAddSystemView extends StatefulWidget {
  const LauncherAddSystemView({Key? key}) : super(key: key);

  @override
  _LauncherAddSystemViewState createState() => _LauncherAddSystemViewState();
}

class _LauncherAddSystemViewState extends State<LauncherAddSystemView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("系统应用与设置"),
      ),
      child: CupertinoScrollbar(
        child: ListView(),
      ),
    );
  }
}
