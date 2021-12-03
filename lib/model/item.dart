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

// To parse this JSON data, do
//
//     final appItemModel = appItemModelFromJson(jsonString);

import 'dart:convert';

AppItemModel appItemModelFromJson(String str) =>
    AppItemModel.fromJson(json.decode(str));

String appItemModelToJson(AppItemModel data) => json.encode(data.toJson());

enum AppItemModelIconType {
  /// 图片
  image,

  /// 自定义
  custom,

  /// 应用程序
  app,
}

class AppItemModel {
  AppItemModel({
    this.name = "",
    this.desc = "",
    this.appIcon = "",
    this.appUrl = "",
    this.appType = AppItemModelIconType.custom,
    this.iconIndex = 0,
    this.bgIndex = 0,
    this.appId = "",
  });

  String name;
  String desc;
  String appIcon;
  String appUrl;
  AppItemModelIconType appType;
  int iconIndex;
  int bgIndex;
  String appId;

  factory AppItemModel.fromJson(Map<String, dynamic> json) => AppItemModel(
        name: json["name"],
        desc: json["desc"],
        appIcon: json["appIcon"],
        appUrl: json["appURL"],
        appType: AppItemModelIconType.values[json["appType"] as int],
        iconIndex: json["iconIndex"],
        bgIndex: json["bgIndex"],
        appId: json["appID"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "appIcon": appIcon,
        "appURL": appUrl,
        "appType": appType.index,
        "iconIndex": iconIndex,
        "bgIndex": bgIndex,
        "appID": appId,
      };
}
