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
import 'package:lanucher/data/gradients.dart';
import 'package:lanucher/data/icons.dart';
import 'package:lanucher/model/item.dart';

class KAppIcon extends StatelessWidget {
  const KAppIcon({
    Key? key,
    this.borderRadius = 24,
    this.width = 120,
    this.height = 120,
    this.iconSize = 82,
    this.iconColor = CupertinoColors.white,
    this.duration = const Duration(
      milliseconds: 420,
    ),
    required this.item,
    this.child,
  }) : super(key: key);

  final double borderRadius;
  final double width;
  final double height;
  final double iconSize;
  final Duration duration;
  final Color iconColor;
  final Widget? child;

  final AppItemModel item;

  int get iconIndex => item.iconIndex;

  int get bgIndex => item.bgIndex;

  AppItemModelIconType get type => item.appType;

  IconData get _currentIconData {
    return cupertinoIconList[iconIndex];
  }

  List<Color> get _currentBgColor {
    Map<String, dynamic> current = gradientsList[bgIndex];
    List<String> data = current["colors"];
    return [
      data[0].toColor(),
      data[1].toColor(),
    ];
  }

  /// 自定义的 `icon` 类型
  /// 使用 [iconIndex] || [bgIndex] 渲染
  Widget get _customImage {
    return Center(
      child: Icon(
        _currentIconData,
        color: iconColor,
        size: iconSize,
      ),
    );
  }

  /// 渲染的图片
  /// 使用 [item.appIcon]
  Widget get _image {
    return Image.network(
      item.appIcon,
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget? get outputImage {
    switch (type) {
      case AppItemModelIconType.custom:
        return _customImage;
      case AppItemModelIconType.image:
        return _image;
      default:
        return child;
    }
  }

  BoxDecoration? get _decoration {
    var canRenderBgGradient = type == AppItemModelIconType.custom;
    return BoxDecoration(
      border: Border.all(color: CupertinoColors.opaqueSeparator.withOpacity(.42)),
      borderRadius: BorderRadius.circular(borderRadius),
      gradient: canRenderBgGradient ? LinearGradient(
        colors: _currentBgColor,
      ) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: AnimatedContainer(
        width: width,
        height: height,
        decoration: _decoration,
        child: outputImage,
        duration: duration,
      ),
    );
  }
}
