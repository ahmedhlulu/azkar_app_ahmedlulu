import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String title;

  MainScreen({this.title = ''});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(widget.title),
          backgroundColor: Colors.teal.shade800,
          actions: [
            PopupMenuButton<int>(
              offset: Offset(0, 40),
              onSelected: (int selectedItem) {
                if (selectedItem == 1) {
                  _changeContent(content: 'أستغفر الله');
                } else if (selectedItem == 2) {
                  _changeContent(content: 'سبحان الله');
                } else if (selectedItem == 3) {
                  _changeContent(content: 'الحمدلله');
                } else if (selectedItem == 4) {
                  _changeContent(content: 'الله أكبر');
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text('أستغفر الله'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('سبحان الله'),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text('الحمدلله'),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('الله أكبر'),
                    value: 4,
                  ),
                ];
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade700,
          onPressed: () {
            setState(() {
              _counter += 1;
            });
          },
          child: Icon(
            Icons.plus_one,
            size: 28,
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade600,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/image.jpg")),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black.withAlpha(41),
                        blurRadius: 6,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _content,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Mada',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade800,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3, 0),
                              color: Colors.black.withOpacity(0.16),
                              blurRadius: 6,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Text(
                          _counter.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal.shade700,
                            minimumSize: Size(0, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            ))),
                        onPressed: () {
                          // _counter += 1;
                          setState(() {
                            ++_counter;
                          });
                        },
                        child: Text('تسبيح'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _counter = 0;
                          });
                        },
                        child: Text('إعادة'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            minimumSize: Size(0, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeContent({required String content}) {
    if (_content != content) {
      setState(() {
        _content = content;
        _counter = 0;
      });
    }
  }
}
