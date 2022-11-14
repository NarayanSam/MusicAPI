import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_music/music.dart';

import 'music.api.dart';
import 'music_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<music> _musics;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getMusic();
  }

  Future<void> getMusic() async {
    _musics = await MusicApi.getMusic();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.library_music_outlined), Text("Music Stall")],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _musics.length,
                itemBuilder: (context, index) {
                  return MusicCard(
                      title: _musics[index].title,
                      artist_name: _musics[index].artist_name,
                      duration: _musics[index].duration.toString(),
                      thumbnailUrl: _musics[index].image);
                },
              ));
  }
}
