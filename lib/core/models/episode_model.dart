import 'package:vexana/vexana.dart';

class Episode extends INetworkModel<Episode>{
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  String? created;

  Episode(
      {this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created});

  Episode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = json['characters'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['air_date'] = this.airDate;
    data['episode'] = this.episode;
    data['characters'] = this.characters;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }

  @override
  Episode fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = json['characters'].cast<String>();
    url = json['url'];
    created = json['created'];
    throw UnimplementedError();
  }
}
