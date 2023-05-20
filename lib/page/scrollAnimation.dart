import 'package:flutter/material.dart';

class ScrollAnimation extends StatefulWidget {
  const ScrollAnimation({super.key});

  @override
  State<ScrollAnimation> createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trung Thong"),),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              background: Image(
                image: AssetImage("assets/Exercises.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            pinned: true,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(-10),
              child: SizedBox()
            ),
            flexibleSpace: const TextField(
              decoration: InputDecoration(
                hintText: "Search"
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.3)
                    ),
                  ),
                );
              },
              childCount: 20
            )
          )
        ],
      ),
    );
  }
}