import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'common/constants.dart';
import 'mock_data.dart';
import 'screens/note_screen.dart';
import 'screens/showcase.dart';

void main() {
  debugProfilePaintsEnabled = true;
  debugProfileBuildsEnabled = true;
  // debugPaintLayerBordersEnabled = true;
  // debugPaintSizeEnabled = true;
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // checkerboardRasterCacheImages: true,
      // checkerboardOffscreenLayers: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Typography.blackMountainView.apply(
          bodyColor: kBaseTextColor,
          displayColor: kBaseTextColor,
          fontFamily: 'Lato',
        ),
        fontFamily: 'Lato',
      ),
      home: Scaffold(
        body: PageView(
          children: const [NoteScreen(notes: fakeNotes), ShowCase()],
        ),
      ),
    );
  }
}
