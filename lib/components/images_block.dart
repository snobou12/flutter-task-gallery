import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/models/image_model.dart';
import 'package:flutter_gallery/pages/image_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagesBlock extends StatefulWidget {
  ImagesBlock({required this.imagesBlockCount, required this.images});
  final int imagesBlockCount;
  final List<ImageModel> images;

  @override
  _ImagesBlockState createState() => _ImagesBlockState();
}

class _ImagesBlockState extends State<ImagesBlock> {
  late final int blockCount;
  @override
  void initState() {
    super.initState();
    blockCount = widget.imagesBlockCount * 6;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 600,
      child: StaggeredGridView.countBuilder(
        physics: ScrollPhysics(),
        shrinkWrap: false,
        crossAxisCount: 4,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImagePage(
                        idImage: widget.images[index + blockCount].id)))
          },
          child: Card(
            elevation: 5.0,
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                image: DecorationImage(
                  image: NetworkImage(widget.images[index + blockCount].url),
                ),
              ),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
