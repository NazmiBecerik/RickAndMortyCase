import 'package:vatan_soft_case/core/models/response_model.dart';
import 'package:vexana/vexana.dart';

class NetworkService{
  INetworkManager<RickAndMortyCharacterData>  networkManagerForCharacter = NetworkManager<RickAndMortyCharacterData>(isEnableLogger: true,
  options: BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));

  Future<IResponseModel<RickAndMortyCharacterData?, RickAndMortyCharacterData?>> getCharacters(String query ) async {
    final response =
        await networkManagerForCharacter.send<RickAndMortyCharacterData,RickAndMortyCharacterData>("/character$query"  , parseModel:RickAndMortyCharacterData(), method: RequestType.GET);
    return response;
  }

  INetworkManager<RickAndMortyCharacterData>  networkManagerForLocation = NetworkManager<RickAndMortyCharacterData>(isEnableLogger: true,
      options: BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));

  Future<IResponseModel<RickAndMortyCharacterData?, RickAndMortyCharacterData?>> getLocations(String pageNumber) async {
    final response =
    await networkManagerForLocation.send<RickAndMortyCharacterData,RickAndMortyCharacterData>("/location?page=$pageNumber" , parseModel:RickAndMortyCharacterData(), method: RequestType.GET);
    return response;
  }

  INetworkManager<RickAndMortyCharacterData>  networkManagerForEpisode = NetworkManager<RickAndMortyCharacterData>(isEnableLogger: true,
      options: BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));

  Future<IResponseModel<RickAndMortyCharacterData?, RickAndMortyCharacterData?>> getEpisodes(String pageNumber) async {
    final response =
    await networkManagerForEpisode.send<RickAndMortyCharacterData,RickAndMortyCharacterData>("/episode?page=$pageNumber" , parseModel:RickAndMortyCharacterData(), method: RequestType.GET);
    return response;
  }

}

