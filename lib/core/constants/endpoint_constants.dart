enum Endpoints {
  character,
  location,
  episode;

  String get path {
    switch (this) {
      case Endpoints.character:
        return "/character";
      case Endpoints.location:
        return "/location";
      case Endpoints.episode:
        return "/episode";
    }
  }
}