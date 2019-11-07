import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  _onPressed(BuildContext context) {
    print("CLICK");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BouncingWidget(
              onPressed: () => _onPressed(context),
              child: Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8185E2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            BouncingWidget(
              onPressed: () => _onPressed(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            BouncingWidget(
              onPressed: () => _onPressed(context),
              child: Text(
                "Hello !",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
