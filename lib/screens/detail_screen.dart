import 'package:flutter/material.dart';
import 'package:shreyas/components/ingredient_list.dart';

import '../components/circleButton.dart';
import '../components/custom_clip_path.dart';

class DetailScreen extends StatefulWidget {
  final Map<String,dynamic> item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    String time=widget.item['totalTime'].toString();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h*.44,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.item['image']),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Positioned(
                    top: h*.04,left: w*.05,
                    child: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: BackButton(color: Colors.white,),
                    )),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: w*.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(widget.item['label'],
                    style: TextStyle(
                        fontSize: w*.05, fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),),
                  const SizedBox(height: 1,),
                  Text("$time min"),
                  SizedBox(height: h*.01,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleButton(icon: Icons.share,label: 'Share',),
                      CircleButton(icon: Icons.bookmark_border,label: 'Save',),
                      CircleButton(icon: Icons.monitor_outlined,label: 'Calories',),
                      CircleButton(icon: Icons.table_chart_outlined,label: 'Unit chart',),
                    ],
                  ),
                  SizedBox(height: h*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Direction", style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: w*.06
                      ),),
                      SizedBox(width: w*0.34,
                      child: ElevatedButton(onPressed: (){}, 
                          child: const Text("Start")),
                      )
                    ],
                  ),

                  SizedBox(height: h*.02,),
                  Container(
                    height: h*.07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: ClipPath(
                              clipper: CustomClipPath(),
                          child: Container(
                            color: Colors.redAccent,
                            child: Center(
                              child: Text("Ingredients Required",
                              style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,fontSize: w*.05),),
                            ),
                          ),
                        )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              child: const Center(
                                child: Text("6\nItems"),
                              ),
                            ))
                      ],
                    )
                  ),
                  SizedBox(height: h*1.8,
                  child: IngredientList(
                    ingredients: widget.item['ingredients'],),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
