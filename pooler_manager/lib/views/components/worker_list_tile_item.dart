import 'package:flutter/material.dart';

class WorkerListTileItem extends StatelessWidget {
  WorkerListTileItem({this.title, this.subTitle});
  final Widget title;
  final Widget subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.engineering_rounded)),
        title: Row(children: [
          Flexible(flex: 2, fit: FlexFit.tight, child: this.title),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ]),
        subtitle: this.subTitle,
        isThreeLine: true,
      ),
    );
  }
}
