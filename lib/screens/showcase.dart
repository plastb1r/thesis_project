import 'package:flutter/material.dart';

import '../mock_data.dart';
import '../widgets/neu_button.dart';
import '../widgets/neu_card.dart';
import '../widgets/neu_chip.dart';
import '../widgets/neu_shape.dart';

class ShowCase extends StatefulWidget {
  const ShowCase();

  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text('Cards'),
              const SizedBox(height: 30),
              getCards(),
              const SizedBox(height: 30),
              const Text('Chips'),
              const SizedBox(height: 30),
              getChips(),
              const SizedBox(height: 30),
              const Text('Buttons'),
              const SizedBox(height: 30),
              NeuButton.stadium(
                  onPressed: () {}, child: const Text('test text')),
              getButtons(),
              const SizedBox(height: 30),
              const Text('Outher Neumorphic Staff'),
              const SizedBox(height: 30),
              getShapes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCards() => Padding(
        padding: const EdgeInsets.all(8),
        child: Wrap(
          runSpacing: 12,
          spacing: 16,
          children: [
            ...List.generate(
              fakeNotes.length,
              (index) => ConstrainedBox(
                constraints: BoxConstraints(maxWidth: (width - 48) / 2),
                child: NeuCard(
                  title: fakeNotes[index].title,
                  description: fakeNotes[index].description,
                  tags: fakeNotes[index].tags,
                ),
              ),
            ),
          ],
        ),
      );

  Widget getButtons() => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height, maxWidth: width),
        child: Row(
          children: <Widget>[
            Expanded(
                child: _getOneColumnWith(NeuButton.stadium(onPressed: () {}))),
            Expanded(
                child: _getOneColumnWith(NeuButton.stadium(onPressed: () {}))),
          ],
        ),
      );

  Widget getShapes() => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height, maxWidth: width),
        child: Row(
          children: <Widget>[
            Expanded(child: _getOneColumnWith(const NeuShape.inactive())),
            Expanded(child: _getOneColumnWith(const NeuShape.card())),
          ],
        ),
      );

  Widget getChips() => Wrap(
        runSpacing: 14,
        spacing: 9,
        children: List.generate(
          6,
          (i) => NeuChip(
            text: fakeTags[i].name,
            color: fakeTags[i].color,
            onPressed: () {},
          ),
        ),
      );

  Widget _getOneColumnWith(Widget it) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: it,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: it,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: it,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: it,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: it,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
