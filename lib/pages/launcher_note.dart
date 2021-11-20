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

class LauncherNote extends StatefulWidget {
  const LauncherNote({Key? key}) : super(key: key);

  @override
  _LauncherNoteState createState() => _LauncherNoteState();
}

class _LauncherNoteState extends State<LauncherNote> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("历史记录"),
    1: Text("收藏")
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlGroupValue,
          children: myTabs,
          onValueChanged: (i) {
            if (i == null) return;
            setState(
              () {
                segmentedControlGroupValue = i as int;
              },
            );
          },
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.delete,
          ),
        ),
      ),
      child: const Text("are you ok?"),
    );
  }
}
