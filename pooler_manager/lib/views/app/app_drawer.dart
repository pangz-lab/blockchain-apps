import 'package:flutter/material.dart';
import 'package:pooler_manager/views/components/drawer_item.dart';
import 'package:pooler_manager/views/cores/main/dashboard/dashboard_view.dart';
import 'package:pooler_manager/views/cores/main/home/home_view.dart';
import 'package:pooler_manager/views/cores/main/worker/worker_list_view.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text('Drawer Header')),
          DrawerItem(
            title: 'Home',
            icon: Icons.home,
            onTap: () {
              Navigator.pushReplacementNamed(
                context, HomeView.routeName);
            }
          ),
          DrawerItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            onTap: () {
              Navigator.pushReplacementNamed(
                context, DashboardView.routeName);
            }
          ),
          DrawerItem(
            title: 'Workers',
            icon: Icons.construction,
            onTap: () {
              Navigator.pushReplacementNamed(
                context, WorkerListView.routeName);
            }
          ),
          DrawerItem(title: 'Process', icon: Icons.loop, onTap: () {}),
          DrawerItem(
            title: 'Connect', icon: Icons.cast_connected, onTap: () {}),
          DrawerItem(title: 'Setting', icon: Icons.settings, onTap: () {}),
        ],
      ),
    );
  }
}
