import 'package:vatan_soft_case/core/models/character_model.dart';
import 'package:vatan_soft_case/core/models/episode_model.dart';
import 'package:vatan_soft_case/core/models/info_model.dart';
import 'package:vatan_soft_case/core/models/location_model.dart';
import 'package:vexana/vexana.dart';

class RickAndMortyCharacterData extends INetworkModel<RickAndMortyCharacterData> {
  final Info? info;
  final List<Character>? results;

  RickAndMortyCharacterData({
     this.info,
     this.results,
  });

  factory RickAndMortyCharacterData.fromJson(Map<String, dynamic> json) {
    return RickAndMortyCharacterData(
      info: Info.fromJson(json['info']),
      results: List<Character>.from(json['results'].map((x) => Character.fromJson(x))),
    );
  }

  @override
  RickAndMortyCharacterData fromJson(Map<String, dynamic> json) {
    return RickAndMortyCharacterData(
      info: Info.fromJson(json['info']),
      results: List<Character>.from(json['results'].map((x) => Character.fromJson(x))),
    );
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class RickAndMortyLocationData extends INetworkModel<RickAndMortyLocationData> {
  final Info? info;
  final List<Location>? results;

  RickAndMortyLocationData({
    this.info,
    this.results,
  });

  factory RickAndMortyLocationData.fromJson(Map<String, dynamic> json) {
    return RickAndMortyLocationData(
      info: Info.fromJson(json['info']),
      results: List<Location>.from(json['results'].map((x) => Location.fromJson(x))),
    );
  }

  @override
  RickAndMortyLocationData fromJson(Map<String, dynamic> json) {
    return RickAndMortyLocationData(
      info: Info.fromJson(json['info']),
      results: List<Location>.from(json['results'].map((x) => Location.fromJson(x))),
    );
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class RickAndMortyEpisodeData extends INetworkModel<RickAndMortyEpisodeData> {
  final Info? info;
  final List<Episode>? results;

  RickAndMortyEpisodeData({
    this.info,
    this.results,
  });

  factory RickAndMortyEpisodeData.fromJson(Map<String, dynamic> json) {
    return RickAndMortyEpisodeData(
      info: Info.fromJson(json['info']),
      results: List<Episode>.from(json['results'].map((x) => Episode.fromJson(x))),
    );
  }

  @override
  RickAndMortyEpisodeData fromJson(Map<String, dynamic> json) {
    return RickAndMortyEpisodeData(
      info: Info.fromJson(json['info']),
      results: List<Episode>.from(json['results'].map((x) => Episode.fromJson(x))),
    );
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
