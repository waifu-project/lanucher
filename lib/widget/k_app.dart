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

class KApp extends StatelessWidget {
  const KApp({
    Key? key,
    this.logo =
        "http://p3.music.126.net/DrRIg6CrgDfVLEph9SNh7w==/18696095720518497.jpg",
    this.name = "Bilibili",
    this.logoRadius = 16,
  }) : super(key: key);

  final String name;

  final String logo;

  final double logoRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(logoRadius),
          child: Image.network(
            logo,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
