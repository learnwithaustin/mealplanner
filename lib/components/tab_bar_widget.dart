import 'package:flutter/material.dart';
import 'package:shreyas/constants/constant_functions.dart';

import '../screens/detail_screen.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return DefaultTabController(length: 4, child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          height:h*.05 ,
          child: TabBar(
            unselectedLabelColor: Colors.red,
            labelColor: Colors.white,
            dividerColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),

            ),
            labelPadding: EdgeInsets.symmetric(horizontal:w*.012 ),

            tabs:const [
              TabItem(title: 'Breakfast'),
              TabItem(title: 'Lunch'),
              TabItem(title: 'Dinner'),
              TabItem(title: 'Quick'),
            ],
          ),
        ),
        SizedBox(
          height: h*.02,
        ),
        SizedBox(
          height: h*.3,
          child: const TabBarView(children: [
            HomeTabBarView(recipe: 'breakfast'),
            HomeTabBarView(recipe: 'lunch'),
            HomeTabBarView(recipe: 'dinner'),
            HomeTabBarView(recipe: 'quick'),

          ]),
        )
      ],
    ));
  }
}

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(title,
          style: const TextStyle(
            fontSize: 9.8
          ),),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String recipe;
  const HomeTabBarView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return SizedBox(
      height: h*.28,
      child:FutureBuilder<List<Map<String,dynamic>>>(
        future: ConstantFunction.getResponse(recipe),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
         else if(!snapshot.hasData){
            return const Center(
              child: Text('no data'),
            );
          }
         return ListView.separated(
             scrollDirection: Axis.horizontal,
             // physics: const NeverScrollableScrollPhysics(),
             itemBuilder: (context,index){
               Map<String,dynamic> snap=snapshot.data![index];
               int time=snap['totalTime'].toInt();
               int calories=snap['calories'].toInt();
               return Container(
                 margin: EdgeInsets.only(
                   right: w*.02
                 ),
                 width: w*.5,
                 child: Stack(
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 DetailScreen(item: snap,)));
                           },
                           child: Container(
                             width: w,
                             height: h*.17,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               image: DecorationImage(image: NetworkImage(snap['image']),
                               fit: BoxFit.fill
                               )
                             ),
                           ),
                         ),
                         SizedBox(height: h*.01,),
                         Text(snap['label'],
                         style: TextStyle(
                           fontSize: w*.035,
                           fontWeight: FontWeight.bold
                         ),),
                         SizedBox(height: h*.01,),
                         Row(
                           children: [
                             Text("Calories: ${calories.toString()} . ${time.toString()} Min",
                             style: TextStyle(
                               fontSize: w*.03,
                               color: Colors.grey
                             ),)
                           ],
                         )
                       ],
                     )
                   ],
                 ),
               );
             },
             separatorBuilder: (context,index){
               return const SizedBox(width: 15,);
             },
             itemCount: snapshot.data!.length);
        }
      ),

    );
  }
}


