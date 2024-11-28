import 'package:animated_rating_stars/animated_rating_stars.dart';
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
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.05,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(articles[index].image),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 6))
                      ]),
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: _articleInfoColumn(_context, articles[index]),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

Widget _articleInfoColumn(BuildContext _context, Article article) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _authorInfoRow(_context,article),
      _articleInfoCenter(_context, article),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 106, 0.0, 0.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _authorContainer(_context),
          ),
        ),
      ),
    ],
  );
}

Widget _authorInfoRow(BuildContext _context, Article article) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          title: Text(article.author),
        ),
        Column(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _articleInfoCenter(BuildContext _context, Article article) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.red,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title, // Display the title of the article
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
          ),
          Text(
            article.location,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedRatingStars(
                initialRating: 3.5,
                minRating: 0.0,
                maxRating: 5.0,
                filledColor: Colors.amber,
                emptyColor: Colors.grey,
                filledIcon: Icons.star,
                halfFilledIcon: Icons.star_half,
                emptyIcon: Icons.star_border,
                onChanged: (double rating) {
                  // Handle the rating change here
                  print('Rating: $rating');
                },
                displayRatingValue: true,
                //interactiveTooltips: true,
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
                starSize: 15.0,
                readOnly: false,
              ),
              SizedBox(width: 5,),
              Text('333km',style:TextStyle(color:Colors.white ) ,),
            ],
          )
        ],
      ),
    ],
  );
}

Widget _authorContainer(BuildContext _context) {
  return Container(
    height: 60,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Icon(Icons.favorite),
        Icon(Icons.messenger,),
        Icon(Icons.share),

      ],
    ),

  );
}
