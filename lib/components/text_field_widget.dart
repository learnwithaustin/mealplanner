import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Container(
      height: h*.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow:const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,1),
            blurRadius: 2
          )
        ]
      ),
      child: TextField(
        style: TextStyle(
          fontSize: w*.04,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "What is cooking in your mind...?",
          hintStyle: TextStyle(
            color: Colors.grey,fontSize: w*.03
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
          ),
          suffixIcon: Icon(Icons.search,
          color: Colors.deepOrangeAccent, size: w*.07,),
        ),
      ),
    );
  }
}
