// import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:musicplayer_nensi/models/musicplay.dart';

// class AppleMusicStore {
//   AppleMusicStore();

//   static const BASE_URL = 'https://itunes.apple.com';
//   static const _SONG_URL = "$BASE_URL/songs";
//   static const _ARTIST_URL = "$BASE_URL/artists";
//   static const _SEARCH_URL = "$BASE_URL/search";

//   Future<dynamic> fetchJSON(String url) async {
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   Future<dynamic> fetchResultsByQuery(String query) async {
//     var completer = new Completer();

//     final url = "$_SEARCH_URL?types=artists&term=$query";

//     final json = await fetchJSON(url);
//     // final List<Results> songs = [];

//     final songJSON = json['results'];
//     completer.complete(songs);
//     return completer.future;
//   }
// }


/*
required this.wrapperType,
        required this.kind,
        required this.artistId,
        required this.collectionId,
        required this.trackId,
        required this.artistName,
        required this.collectionName,
        required this.trackName,
        required this.collectionCensoredName,
        required this.trackCensoredName,
        required this.artistViewUrl,
        required this.collectionViewUrl,
        required this.trackViewUrl,
        required this.previewUrl,
        required this.artworkUrl30,
        required this.artworkUrl60,
        required this.artworkUrl100,
        required this.collectionPrice,
        required this.trackPrice,
        required this.releaseDate,
        required this.collectionExplicitness,
        required this.trackExplicitness,
        required this.discCount,
        required this.discNumber,
        required this.trackCount,
        required this.trackNumber,
        required this.trackTimeMillis,
        required this.country,
        required this.currency,
        required this.primaryGenreName,
        required this.isStreamable,
        required this.collectionArtistId,
        required this.collectionArtistName,
        required this.contentAdvisoryRating,
        required this.collectionArtistViewUrl,
*/