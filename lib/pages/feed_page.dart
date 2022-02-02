import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdp_ui9_instagram/models/post_model.dart';
import 'package:pdp_ui9_instagram/models/story_model.dart';
class FeedPage extends StatefulWidget {
  static String id="feed_page";

  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story>_stories=[
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Bek"),
    Story("assets/images/user_4.jpeg", "Djenevra"),
    Story("assets/images/user_5.jpeg", "Alisa"),
  ];
  final List <Post> _posts=[
    Post(
        "Jazmin",
        "assets/images/user_1.jpeg",
        "assets/images/feed_1.jpeg",
        "Consequatur nihil aliquid omnis consequatur",),
    Post(
      "Jazmin",
      "assets/images/user_2.jpeg",
      "assets/images/feed_2.jpeg",
      "Consequatur nihil aliquid omnis consequatur",),
    Post(
      "Jazmin",
      "assets/images/user_3.jpeg",
      "assets/images/feed_3.jpeg",
      "Consequatur nihil aliquid omnis consequatur",),
    Post(
      "Jazmin",
      "assets/images/user_4.jpeg",
      "assets/images/feed_4.jpeg",
      "Consequatur nihil aliquid omnis consequatur",),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
       padding: EdgeInsets.symmetric(horizontal: 14),
       child: SingleChildScrollView(
         child: Column(
          children: [
            //#stories and WatchAll
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Stories",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  Text("Watch All",style: TextStyle(color: Colors.grey,fontSize: 14),),

                ],
              ),
            ),
            //#StoryList
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,

              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children:_stories.map((story) {
                  return _itemsOfStory(story);
                }).toList(),
              ),
            ),
            //#PostList
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _stories.length,
                itemBuilder: (ctx,i){
                  return itemOfPost(_posts[i]);
                },
              ),
            ),
          ],
         ),
       ),
      ),
    );
  }
}
Widget itemOfPost(Post post){
  return Container(
    color: Colors.black,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //#Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(

                    borderRadius: BorderRadius.circular(40),
                    child: Image(image: AssetImage(post.postImage,),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),
                  Text(post.userName,style: TextStyle(color: Colors.grey),),
                ],
              ),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.more_horiz,size: 30,color: Colors.grey,),),
            ],
          ),
        ),
        FadeInImage(
          placeholder: AssetImage("assets/images/placeholder.png"),
          image: AssetImage(post.postImage),
        ),
        //#Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_outlined,color: Colors.grey,),),
                IconButton(onPressed: (){}, icon:Icon(Icons.comment,color: Colors.grey,),),
                IconButton(onPressed: (){}, icon:Icon(Icons.send_outlined,color: Colors.grey,),),
              ],
            ),
            IconButton(onPressed: (){}, icon:Icon(Icons.bookmark,color: Colors.grey,)),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                text: "Liked by:",
                style: TextStyle(color: Colors.grey),
              ),
                TextSpan(
                text: "Sigmund ",
                style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
              ),
                TextSpan(
                  text: "Jasur ",
                  style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "and",
                  style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
                ),
                TextSpan (
                  text: "1230 other",
                  style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
                ),


              ],
            ),
          ),
        ),
        //#caption
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: ("${post.caption}"),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        //#postdate
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.topLeft,

          child: Text(
            "02.02.2022",textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}
Widget _itemsOfStory (Story story){
   return Column(
     children: [
       //#stories image
       Container(
         margin: EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(70),
           border: Border.all(
             color: Color(0xFF8e44ad),
           ),
         ),
         child: Container(
           padding: EdgeInsets.all(2),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(70),
             child: Image(image: AssetImage(story.image),
             width: 70,),
           ),
         ),
       ),
       SizedBox(height: 10,),
       Text(story.name,style: TextStyle(color: Colors.grey),),
     ],
   );
}
