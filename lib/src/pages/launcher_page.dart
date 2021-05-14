import 'package:custom_painter/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Designs')),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageRoutes[index].page,
              ));
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'UA',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Expanded(child: _OptionsList()),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                    value: true,
                    activeColor: Colors.blue,
                    onChanged: (value) {}),
              ),
              ListTile(
                leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
                title: Text('Custom Mode'),
                trailing: Switch.adaptive(
                    value: true,
                    activeColor: Colors.blue,
                    onChanged: (value) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
