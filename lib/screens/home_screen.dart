import 'package:flutter/material.dart';
import 'package:shreyas/components/home_app_bar.dart';
import 'package:shreyas/components/tab_bar_widget.dart';
import 'package:shreyas/constants/images_path.dart';

import '../components/text_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SizedBox(
                  height: h*.022,
                ),
                const TextFieldWidget(),
                SizedBox(
                  height: h*.022,
                ),
                Container(
                  height: h*.25,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPath.explore), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                SizedBox(height: h*.023,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories',
                    style: TextStyle(
                      fontSize: w*.045,fontWeight: FontWeight.bold
                    ),),
                    const Text('See all'),
                    SizedBox(height: w*.022,)
                  ],
                ),
                SizedBox(height: h*.022,),
                const TabBarWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
