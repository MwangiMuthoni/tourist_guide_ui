import 'package:flutter/material.dart';
import '../data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> _locations = ['Poluare', 'Japan', 'Moscow', 'London'];
  int _activeLocation = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(actions: [
        //   ListTile(
        //     leading: Icon(Icons.menu),
        //     title: Image.asset('assets/images/logo_discover.png'),
        //      trailing: Icon(Icons.search),
        //   )
        // ],),
        body: SafeArea(
            top: true,
            left: false,
            right: false,
            bottom: true,
            minimum: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.height * 0.05,
                0),
            child: _mainColumn(context)));
  }

  Widget _mainColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 35,
              color: Colors.black87,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo_discover.png'),
                ),
              ),
            ),
            Icon(
              Icons.search,
              size: 35,
              color: Colors.black87,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
          ),
          child: _locationBar(_context),
        ),
        _articlesList(_context),
      ],
    );
  }

  Widget _locationBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((L) {
          bool _isActive = _locations[_activeLocation] == L ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                L,
                style: TextStyle(
                    fontSize: 15,
                    color: _isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat'),
              ),
              _isActive
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 5,
                      width: 50,
                    )
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }
}

Widget _articlesList(BuildContext _context) {
  return Expanded(
    child: ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(articles[index].image),
                fit: BoxFit.cover),
              boxShadow: [BoxShadow(color: Colors.black38,spreadRadius: 2,blurRadius:20,offset: Offset(0, 6) )]
              ),
              height: MediaQuery.of(context).size.height * 0.30,

            ),
          ),
        );
      },
    ),
  );
}
