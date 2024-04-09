// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamImpl _$$TeamImplFromJson(Map<String, dynamic> json) => _$TeamImpl(
      name: json['name'] as String,
      icon: Uri.parse(json['icon'] as String),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TeamImplToJson(_$TeamImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon.toString(),
      'country': instance.country,
      'league': instance.league,
    };
