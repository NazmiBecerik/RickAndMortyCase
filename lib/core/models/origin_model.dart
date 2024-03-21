import 'package:vexana/vexana.dart';

class Origin extends INetworkModel<Origin>{
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  @override
  Origin fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    name = json['name'];
    url = json['url'];
    throw UnimplementedError();
  }
}