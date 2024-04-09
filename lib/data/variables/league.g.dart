// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeagueImpl _$$LeagueImplFromJson(Map<String, dynamic> json) => _$LeagueImpl(
      name: json['name'] as String,
      icon: Uri.parse(json['icon'] as String),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeagueImplToJson(_$LeagueImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon.toString(),
      'country': instance.country,
    };
