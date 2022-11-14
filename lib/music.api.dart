import 'dart:convert';
import 'music.dart';
import 'package:http/http.dart' as http;

class MusicApi {
//const req = unirest("GET", "https://youtube-music1.p.rapidapi.com/v2/search");
//
//req.query({
//	"query": "Taylor Swift"
//});
//
//req.headers({
//	"X-RapidAPI-Key": "cf02079bb5mshf9f140cc507e1abp1b3f37jsn404feb9b3d40",
//	"X-RapidAPI-Host": "youtube-music1.p.rapidapi.com",
//	"useQueryString": true
//});
  static Future<List<music>> getMusic() async {
    var uri = Uri.https("youtube-music1.p.rapidapi.com", '/v2/search',
        {"query": "Taylor Swift"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "cf02079bb5mshf9f140cc507e1abp1b3f37jsn404feb9b3d40",
      "X-RapidAPI-Host": "youtube-music1.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['result']) {
      _temp.add(i['songs']);
    }
    return music.musicsFromSnapshot(_temp);
  }
}
