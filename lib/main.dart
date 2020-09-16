import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/constants.dart';
import 'package:online_course_app/details_screen.dart';
import 'package:online_course_app/model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/user.png")
              ],
            ),
            SizedBox(height: 30),
            Text("Olá Alysson", style: kHeadingextStyle,),
            Text("Ache um curso que queira aprender", style: kSubheadingextStyle,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  Text(
                    "Procure por alguma coisa",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD)
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text("Categoria", style: kTitleTextStyle),
                  Text(
                    "Veja todos",
                    style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                  ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20, 
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context){
                            return DetailsScreen();
                          }
                        )
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle
                          ),
                          Text(
                            '${categories[index].numOfCourses} Cursos',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, 
                staggeredTileBuilder: (index) => StaggeredTile.fit(1)
              )
            )
          ],
        ),
      ),
    );
  }
}