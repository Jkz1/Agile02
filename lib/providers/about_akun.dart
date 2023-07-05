import 'package:flutter/material.dart';

class AboutAkun extends ChangeNotifier {
  List<Map<String, dynamic>> _data = [
    {
      "name": "Joko CH.",
      "username": "jokowii",
      "job": ["Streamer, ", "Content Creator"],
      "img": "assets/jokowi.jpg",
      "desc":
          "Haloo semua! perkenalkan nama saya joko widodo. Saya adalah seorang streamer di twitch dan youtube yang biasanya saya live random, tapi biasanya saya suka react meme tentang pemerintahan kita yang lucu >< \n \nJangan lupa support saya lewat bagibagi yaa. Setiap donasi yang kalian berikan sangat berarti bagi saya agar saya tetap semangat livenya hehe~ \n \nKalian yang sudah support saya juga bakal dapat kesempatan untuk main bareng saya dan tentunya kita bisa have fun bareng deh \n \nSegitu aja sih pengenalan singkat tentang saya. Jangan lupa follow bagibagi saya juga yaa, cyaa~",
      "youtube": "https://www.youtube.com/@Jokowi",
      "twitch": "https://www.twitch.tv/tarik"
    },
    {
      "name": "Joko CH. 2",
      "username": "jokowii",
      "job": ["Streamer, ", "Content Creator"],
      "img": "assets/jokowi.jpg",
      "desc":
          "Haloo semua! perkenalkan nama saya joko widodo. Saya adalah seorang streamer di twitch dan youtube yang biasanya saya live random, tapi biasanya saya suka react meme tentang pemerintahan kita yang lucu >< \n \nJangan lupa support saya lewat bagibagi yaa. Setiap donasi yang kalian berikan sangat berarti bagi saya agar saya tetap semangat livenya hehe~ \n \nKalian yang sudah support saya juga bakal dapat kesempatan untuk main bareng saya dan tentunya kita bisa have fun bareng deh \n \nSegitu aja sih pengenalan singkat tentang saya. Jangan lupa follow bagibagi saya juga yaa, cyaa~",
      "youtube": "https://www.youtube.com/@Jokowi",
      "twitch": "https://www.twitch.tv/tarik"
    },
    {
      "name": "Joko CH. 3",
      "username": "jokowii",
      "job": ["Streamer, ", "Content Creator"],
      "img": "assets/jokowi.jpg",
      "desc":
          "Haloo semua! perkenalkan nama saya joko widodo. Saya adalah seorang streamer di twitch dan youtube yang biasanya saya live random, tapi biasanya saya suka react meme tentang pemerintahan kita yang lucu >< \n \nJangan lupa support saya lewat bagibagi yaa. Setiap donasi yang kalian berikan sangat berarti bagi saya agar saya tetap semangat livenya hehe~ \n \nKalian yang sudah support saya juga bakal dapat kesempatan untuk main bareng saya dan tentunya kita bisa have fun bareng deh \n \nSegitu aja sih pengenalan singkat tentang saya. Jangan lupa follow bagibagi saya juga yaa, cyaa~",
      "youtube": "https://www.youtube.com/@Jokowi",
      "twitch": "https://www.twitch.tv/tarik"
    }
  ];

  List<Map<String, dynamic>> get data => _data;

  set setdata(val) {
    _data = val;
    notifyListeners();
  }
}
