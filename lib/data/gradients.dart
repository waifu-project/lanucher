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

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return const Color(0xFFFFFFFF);
  }
}

var gradientsList = [
  {
    "name": "Farhan",
    "colors": ["#9400D3", "#4B0082"]
  },
  {
    "name": "Purple",
    "colors": ["#c84e89", "#F15F79"]
  },
  {
    "name": "Ibtesam",
    "colors": ["#00F5A0", "#00D9F5"]
  },
  {
    "name": "The Sky And The Sea",
    "colors": ["#F7941E", "#004E8F"]
  },
  {
    "name": "From Ice To Fire",
    "colors": ["#72C6EF", "#004E8F"]
  },
  {
    "name": "Blue & Orange",
    "colors": ["#FD8112", "#0085CA"]
  },
  {
    "name": "Purple Dream",
    "colors": ["#bf5ae0", "#a811da"]
  },
  {
    "name": "Blu",
    "colors": ["#00416A", "#E4E5E6"]
  },
  {
    "name": "Summer Breeze",
    "colors": ["#fbed96", "#abecd6"]
  },
  {
    "name": "Ver",
    "colors": ["#FFE000", "#799F0C"]
  },
  {
    "name": "Ver Black",
    "colors": ["#F7F8F8", "#ACBB78"]
  },
  {
    "name": "Anwar",
    "colors": ["#334d50", "#cbcaa5"]
  },
  {
    "name": "Reaqua",
    "colors": ["#799F0C", "#ACBB78"]
  },
  {
    "name": "Mango",
    "colors": ["#ffe259", "#ffa751"]
  },
  {
    "name": "Bupe",
    "colors": ["#00416A", "#E4E5E6"]
  },
  {
    "name": "Rea",
    "colors": ["#FFE000", "#799F0C"]
  },
  {
    "name": "Windy",
    "colors": ["#acb6e5", "#86fde8"]
  },
  {
    "name": "Royal Blue",
    "colors": ["#536976", "#292E49"]
  },
  {
    "name": "Copper",
    "colors": ["#B79891", "#94716B"]
  },
  {
    "name": "Anamnisar",
    "colors": ["#9796f0", "#fbc7d4"]
  },
  {
    "name": "Petrol",
    "colors": ["#BBD2C5", "#536976"]
  },
  {
    "name": "Sky",
    "colors": ["#076585", "#fff"]
  },
  {
    "name": "Sel",
    "colors": ["#00467F", "#A5CC82"]
  },
  {
    "name": "Afternoon",
    "colors": ["#000C40", "#607D8B"]
  },
  {
    "name": "Skyline",
    "colors": ["#1488CC", "#2B32B2"]
  },
  {
    "name": "DIMIGO",
    "colors": ["#ec008c", "#fc6767"]
  },
  {
    "name": "Purple Love",
    "colors": ["#cc2b5e", "#753a88"]
  },
  {
    "name": "Sexy Blue",
    "colors": ["#2193b0", "#6dd5ed"]
  },
  {
    "name": "Blooker20",
    "colors": ["#e65c00", "#F9D423"]
  },
  {
    "name": "Sea Blue",
    "colors": ["#2b5876", "#4e4376"]
  },
  {
    "name": "Nimvelo",
    "colors": ["#314755", "#26a0da"]
  },
  {
    "name": "Noon to Dusk",
    "colors": ["#ff6e7f", "#bfe9ff"]
  },
  {
    "name": "YouTube",
    "colors": ["#e52d27", "#b31217"]
  },
  {
    "name": "Cool Brown",
    "colors": ["#603813", "#b29f94"]
  },
  {
    "name": "Harmonic Energy",
    "colors": ["#16A085", "#F4D03F"]
  },
  {
    "name": "Playing with Reds",
    "colors": ["#D31027", "#EA384D"]
  },
  {
    "name": "Sunny Days",
    "colors": ["#EDE574", "#E1F5C4"]
  },
  {
    "name": "Green Beach",
    "colors": ["#02AAB0", "#00CDAC"]
  },
  {
    "name": "Intuitive Purple",
    "colors": ["#DA22FF", "#9733EE"]
  },
  {
    "name": "Emerald Water",
    "colors": ["#348F50", "#56B4D3"]
  }
];
