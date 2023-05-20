import 'package:flutter/material.dart';

class BackHome extends StatelessWidget {
  const BackHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 0, bottom: 40),
                child: Image.asset("assets/Exercises.png"),
              ),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Congratulations, You Have Finished Your Workout",
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.4,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
        
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 30, left: 30),
                child: Text(
                  "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.3,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(123, 111, 114, 1)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
        
              const Text(
                "-Jack Lalanne",
                style: TextStyle(
                  color:  Color.fromRGBO(123, 111, 114, 1),
                  height: 1.6,
                  fontWeight: FontWeight.w400
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 50),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(157, 206, 255, 1),
                          Color.fromRGBO(146, 163, 253, 1)
                        ]
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:const [
                        BoxShadow(
                          color: Color.fromRGBO(149, 173, 254, 0.3),
                          blurStyle: BlurStyle.inner,
                          offset: Offset(0, 3),
                          blurRadius: 20
                        )
                      ],
                    ),
                    child: const Text(
                      "Back To Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}