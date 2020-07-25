import 'package:http/http.dart' show Client;
import 'package:rainy/model/weatherData.dart';

class MapApi {
  static const _apiKey = "562a8b29fb29577b6047a1eee7b5d660";
  static const _endpoint = 'http://api.openweathermap.org/data/2.5';
  double lat, lon;
  Client client = Client();
  static MapApi _instance;
  static MapApi getInstance() => _instance ??= MapApi();
  
  String _apiCall({double lat, double lon}) {
    return  _endpoint + "/weather?lat=" + lat.toString() + "&lon=" + lon.toString() + "&APPID=" 
    + _apiKey + "&units=metric";
  }

  getWeather(double lat, double lon)  async { 
var response = await client.get(
  Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
  headers: {
    'Accept': 'Application/json'
  }
); return WeatherData.deserialize(response.body);

  }
}