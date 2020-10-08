import 'package:flutter/material.dart';

class WorkerListTileItem extends StatelessWidget {
  WorkerListTileItem({this.title, this.subTitle, this.onTap, this.onLongPress});
  final Widget title;
  final Widget subTitle;
  final Function onTap;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: this.onTap,
        onLongPress: this.onLongPress,
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
