import 'package:flutter/material.dart';
import 'package:pdp_ui9_instagram/pages/feed_page.dart';
import 'package:pdp_ui9_instagram/pages/like_page.dart';

class HomePage extends StatefulWidget {
  static String id="home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage=0;
  var _pages =[
     FeedPage(),
     LikePage(),
     FeedPage(),
     FeedPage(),
     FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text('Instagram',style: TextStyle(color: Colors.grey,),),
    leading: IconButton(
    onPressed: (){},
    icon: const Icon(Icons.camera_alt_outlined,color: Colors.grey,),),

        actions: [
          IconButton(onPressed: (){},
              icon:const Icon(Icons.live_tv_rounded,color: Colors.grey,),),
          IconButton(onPressed: (){},
              icon: const Icon(Icons.send_outlined,color: Colors.grey,),),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage=i;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp),
            label: "post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "home",
          ),
        ],
      ),
    );
  }
}
