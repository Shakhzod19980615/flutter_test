import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

import 'const/MyBehavior.dart';
import 'const/app_color.dart';
import 'model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  final List<String> categories = [

    "Favourites",
    "Clubs",
    "Aquaparks",
    "Restaurants",
    "Hookah"

  ];
  final List<String> icons = [
    'assets/icons/ic_favourites.svg',
    'assets/icons/ic_clubs.svg',
    'assets/icons/ic_aquaparks.svg',
    'assets/icons/ic_restauransts.svg',
    'assets/icons/ic_hookah.svg'


  ];
  late List<Product> searchList;
  int? _expandedIndex;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Random _random;
  late int _diceNumber;

  @override
  void initState() {
    super.initState();
    _diceNumber = 0;
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _random = Random();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _rollDice() {
    _controller.forward();
    setState(() {
      _diceNumber = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    searchList = productList
        .where((element)=>
        element.category.contains(text)).toList();

    return SafeArea(

      child: Scaffold(

        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      _rollDice();
                      text="";
                      setState(() {
                        _expandedIndex = null;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child:  SizedBox(
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: 360 * _diceNumber / 6 * _animation.value,
                              child: SvgPicture.asset(
                                'assets/icons/ic_dice1.svg',
                                width: 20,
                                height: 20,

                              ),
                            );
                          },
                        ),
                      ),
                      ),
                    ),
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SizedBox(
                      height:60,
                      width: MediaQuery.of(context).size.width - 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context,index){

                            return Container(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: InkWell(

                                  onTap: (){
                                    setState(() {
                                      _rollDice();
                                      text = categories[index];
                                      _expandedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                                    decoration:  BoxDecoration(
                                        color: _expandedIndex == index? AppColor.white: Colors.black,
                                        borderRadius: const BorderRadius.all(Radius.circular(24))
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:const EdgeInsets.only(right:8),
                                          child: SvgPicture.asset(
                                              icons[index], width: 10, height: 10,
                                              color:_expandedIndex == index? AppColor.black: AppColor.white
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal:2,vertical: 6),
                                          child: Text(categories[index], style: TextStyle(
                                              color:_expandedIndex == index? AppColor.black: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              //_singleItem(categories[index], icons[index], index));
                            );
                          }),
                    ),
                  ),
                  ]
              ),
            ),

            ScrollConfiguration(
              behavior: MyBehavior(),
              child: Expanded(child: ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      decoration: const BoxDecoration(color:AppColor.white,
                          borderRadius:BorderRadius.all(Radius.circular(24) )),
                      child:  ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal :20,
                            vertical:10),
                        title: Text(searchList[index].name,style: const TextStyle(color: AppColor.textColor, fontWeight: FontWeight.bold),),
                        subtitle:Text(searchList[index].category,style: const TextStyle(color: AppColor.lineColor, fontWeight: FontWeight.normal),),
                      ),
                    );
                  })
              ),
            )
            ]
        ),

      ),
    );
  }
}
