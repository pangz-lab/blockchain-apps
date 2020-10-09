import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/views/vurd_action_interface.dart';

class WorkerListTileItem extends StatelessWidget {
  WorkerListTileItem({
    this.title,
    this.subTitle,
    this.onTap,
    this.onLongPress,
    this.itemButtonActions,
  });
  final Widget title;
  final Widget subTitle;
  final Function onTap;
  final Function onLongPress;
  final VurdActionInterface itemButtonActions;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      onTap: this.onTap,
      onLongPress: this.onLongPress,
      subtitle: this.subTitle,
      leading: CircleAvatar(child: Icon(Icons.engineering_rounded)),
      title: Row(children: [
        Flexible(flex: 1, fit: FlexFit.tight, child: this.title),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              actionButton(
                icon: Icons.remove_red_eye,
                tooltip: 'view',
                onPressed: itemButtonActions.view
              ),
              actionButton(
                icon: Icons.edit,
                tooltip: 'edit',
                onPressed: itemButtonActions.update),
              actionButton(
                icon: Icons.delete,
                tooltip: 'delete',
                color: Colors.redAccent,
                onPressed: itemButtonActions.delete
              ),
              actionButton(
                icon: Icons.play_arrow,
                tooltip: 'run',
                size: 50.0,
                color: Colors.green,
                onPressed: itemButtonActions.run
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget actionButton({
    IconData icon,
    double size = 24.00,
    double splashRadius = 20.0,
    Color color = Colors.blueGrey,
    String tooltip,
    Function onPressed
  }) {
    return IconButton(
      splashRadius: splashRadius,
      iconSize: size,
      tooltip: tooltip,
      icon: Icon(
        icon,
        color: color
      ),
      onPressed: onPressed,
      padding: EdgeInsets.all(0.0),
    );
  }
}