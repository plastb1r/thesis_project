import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/constants.dart';
import '../entities/note_entity.dart';
import '../widgets/custom_sliver_app_bar.dart';
import '../widgets/neu_button.dart';
import '../widgets/neu_card.dart';
import '../widgets/neu_shape.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key key, this.notes}) : super(key: key);

  final List<NoteEntity> notes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: kListAppBarPadding,
            sliver: CustomSliverAppBar(
              leading: NeuButton.circle(
                padding: kZeroEdgeInsets,
                onPressed: () {},
                child: SvgPicture.asset(
                  kAssetIconTag,
                  fit: BoxFit.scaleDown,
                ),
              ),
              center: NeuShape.inputField(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: kAppBarSearchHintText,
                    prefixIcon: SvgPicture.asset(
                      kAssetIconSearch,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              actions: [
                NeuButton.circle(
                  padding: kZeroEdgeInsets,
                  onPressed: () {},
                  child: SvgPicture.asset(
                    kAssetIconAdd,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: kListPadding,
            sliver: SliverStaggeredGrid.countBuilder(
              crossAxisCount: kColumnCount,
              staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
              itemBuilder: (_, index) => NeuCard(
                key: ValueKey(notes[index].id),
                title: notes[index].title,
                description: notes[index].description,
                tags: notes[index].tags,
              ),
              itemCount: notes.length,
              mainAxisSpacing: kListMainAxisSpacing,
              crossAxisSpacing: kListCrossAxisSpacing,
            ),
          ),
        ],
      ),
    );
  }
}
