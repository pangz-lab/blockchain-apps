import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/views/action_button_interface.dart';

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
  final ActionButtonInterface itemButtonActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,2,0,2),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(BorderSide(width: 1.0, color: Colors.black45)),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: ListTile(
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
                // actionButton(
                //   icon: Icons.remove_red_eye,
                //   tooltip: 'view',
                //   onPressed: itemButtonActions.view
                // ),
                actionButton(
                  icon: Icons.edit,
                  tooltip: 'edit',
                  onPressed: itemButtonActions.update),
                actionButton(
                  icon: Icons.delete,
                  tooltip: 'delete',
                  color: Colors.redAccent,
                  onPressed: itemButtonActions.delete
                )
              ],
            ),
          ),
        ]),
      ),
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