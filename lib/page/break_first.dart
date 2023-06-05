import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreakFirst extends StatefulWidget {
  const BreakFirst({super.key});
  @override
  State<BreakFirst> createState() => _BreakFirstState();
}

class _BreakFirstState extends State<BreakFirst> {

  final Gradient primaryColor = const LinearGradient(
    colors: [
    Color.fromRGBO(157, 206, 255, 1),
    Color.fromRGBO(146, 163, 253, 1),
    ]
  );

  final Gradient gradientBlue = const LinearGradient(
    colors: [
      Color.fromRGBO(157, 206, 255, 0.244) , 
      Color.fromRGBO(146, 164, 253, 0.203)
    ]
  );
  final Gradient gradientPink = const LinearGradient(
    colors: [
      Color.fromRGBO(238, 164, 206, 0.201),
      Color.fromRGBO(197, 139, 242, 0.199),
    ]
  );
  final Color colorPopular= const Color.fromRGBO(29, 22, 23, 0);
  final Color colorText= const Color.fromRGBO(123, 111, 114, 1);
  final Color colorHeader= const Color.fromRGBO(247, 248, 248, 1);
  final Color colorInputSearch= const Color.fromRGBO(221, 218, 218, 1);

  final Color colorIconPopular= Colors.purple.shade100;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                header(),

                const SizedBox(height: 20,),
                inputSearch(),

                const SizedBox(height: 28,),
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 130,
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1/0.82,
                    scrollDirection: Axis.horizontal,
                    children: pancakes.map((item){
                      return category(item: item);
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 25,),
                const Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                    "Recommendation for Diet",
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.4,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 280,
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1/0.82,
                    scrollDirection: Axis.horizontal,
                    children: cakes.map((item){
                      return cake(item: item);
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 25,),
                const Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 20,),
                popular(
                  image: "assets/pancake.png",
                  text: "Blueberry Pancake",
                  subtile: "Medium | 30mins | 230kCal",
                  select: true
                ),
                const SizedBox(height: 20,),
                popular(
                  image: "assets/salmon.png",
                  text: "Salmon Nigiri",
                  subtile: "Medium | 20mins | 120kCal"
                ),
                const SizedBox(height: 20,),
                popular(
                  image: "assets/pancake.png",
                  text: "Blueberry Pancake",
                  subtile: "Medium | 30mins | 230kCal"
                ),
                const SizedBox(height: 20,),
                popular(
                  image: "assets/pancake.png",
                  text: "Blueberry Pancake",
                  subtile: "Medium | 30mins | 230kCal"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget popular({required image, required text, required subtile, select=false}){
    return Container(
      height: 90,
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:select? colorPopular : Colors.transparent),
        borderRadius: BorderRadius.circular(20),
        boxShadow: select? [
          const BoxShadow(
            color: Color.fromRGBO(29, 22, 23, 0.208),
            offset: Offset(3, 4),
            blurRadius: 20
          )
        ]: null
      ),
      child: Row(
        children: [
          Image.asset(image),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                subtile,
                style: TextStyle(
                  color: colorText,
                  height: 1.8
                ),
              ),
            ],
          ),

          const SizedBox(width: 50,),

          Stack(
            children:[
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: colorIconPopular, width: 1.7),
                  borderRadius: BorderRadius.circular(50),

                ),
              ),

              Positioned(
                top: -8,
                right: -10,
                child: IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.keyboard_arrow_right, color: colorIconPopular,)
                ),
              ),
            ] 
          ),
        ],
      ),
    );
  }

  Widget cake({required item}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: item.isColor ? gradientBlue : gradientPink
      ),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Image.asset(item.image),
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 3
            ),
          ),
          Text(
            item.discription,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: colorText
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 38,
              width: 110,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: item.isColor ? primaryColor : null,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                "View",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color:item.isColor? Colors.white : Colors.purpleAccent
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget category({required item}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: item.isColor ? gradientBlue : gradientPink
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(item.image)
          ),
          const SizedBox(height: 20,),
          Text(item.name)
        ],
      ),
    );
  }

  Widget header(){
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 30),
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: colorHeader,
          borderRadius: BorderRadius.circular(3)
        ),
        child: IconButton(
          onPressed: (){},
          padding: const EdgeInsets.only(bottom: 1),
          icon: const Icon(Icons.arrow_back_ios_new, size: 15, color: Colors.black,)
        ),
      ),
  
      title: const Text(
        "Breakfast",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900
        ),
      ),
  
      trailing: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: colorHeader,
          borderRadius: BorderRadius.circular(7)
        ),
        child: IconButton(
          onPressed: (){},
          padding: const EdgeInsets.symmetric(horizontal: 4),
          icon: const Icon(Icons.more_horiz, color: Colors.black,)
        )
      ),
    );
  }

  Widget inputSearch(){
    return Container(
      padding: const EdgeInsets.only(right: 25),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(5,5),
            blurRadius: 30.0,
            color: Color.fromRGBO(29, 22, 23, 0.07),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "search Pancake",
          hintStyle: TextStyle(color: colorInputSearch),
          prefixIcon: const Icon(Icons.search, size: 30, ),
          suffixIcon: SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: colorInputSearch)
                    )
                  ),
                ),
                SvgPicture.asset('assets/Filter.svg', color: Colors.blue,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Pancake> pancakes=[
  Pancake("Salad", "assets/salad.png", true, ""),
  Pancake("Cake", "assets/cake.png", false, ""),
  Pancake("Pie", "assets/Pie.png", true, ""),
  Pancake("Smoothies", "assets/orange.png", false, ""),
  Pancake("PanCake", "assets/pancake.png", true, ""),
  Pancake("Salmon", "assets/salmon.png", false, "")
];

List<Pancake> cakes=[
  Pancake("Honey Pancake", "assets/cake_largest.png", true, "Easy | 30mins | 180kCal"),
  Pancake("Canai Bread", "assets/cake_apple.png", false, "Easy | 20mins | 230kCal"),
  Pancake("Pie", "assets/Pie.png", true, "Easy | 20mins | 230kCal"),
  Pancake("Smoothies", "assets/orange.png", false, "Easy | 20mins | 230kCal"),
  Pancake("PanCake", "assets/pancake.png", true, "Easy | 20mins | 230kCal"),
  Pancake("Salmon", "assets/salmon.png", false, "Easy | 20mins | 230kCal")
];

class Pancake{
  final String name;
  final String image;
  final bool isColor;
  final String discription;
  Pancake(this.name, this.image, this.isColor, this.discription);
}