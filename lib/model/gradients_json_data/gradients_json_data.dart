import 'package:flutter/foundation.dart';

@immutable
class GradientsJsonData {
  final String? name;
  final List<String>? colors;

  const GradientsJsonData({this.name, this.colors});

  @override
  String toString() => 'GradientsJsonData(name: $name, colors: $colors)';

  factory GradientsJsonData.fromJson(Map<String, dynamic> json) {
    return GradientsJsonData(
      name: json['name'] as String?,
      colors: List<String>.from(json['colors']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'colors': colors,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GradientsJsonData) return false;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ colors.hashCode;
}
