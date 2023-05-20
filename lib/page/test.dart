import 'package:fixnext/page/break_first.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // ------
  List<Pancake> items=List.from(cakes);
  final listKey = GlobalKey<AnimatedListState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text("Trung Thông"),
        centerTitle: true,
      ),

      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: () => removeItem(index),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: insertItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  void insertItem(){
    const newIndex=1;
    final newItem= (List.of(cakes)..shuffle()).first;
    items.insert(
      newIndex, 
      newItem
    );
    listKey.currentState!.insertItem(
      newIndex,
      duration: const Duration(milliseconds: 600)
    );
  }

  void removeItem(int index){
    items.removeAt(index);
    listKey.currentState!.removeItem(
      index, 
      (context, animation) => ListItemWidget(
        item: items[index], 
        animation: animation, 
        onClicked: (){}
      ),
      duration: const Duration(milliseconds: 600)
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.item,
    required this.animation,
    required this.onClicked
  });
  final Pancake item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      key: ValueKey(item.image),
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.linear
      )),
      child: Container(
        margin: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(item.image)
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          trailing: IconButton(
            onPressed: onClicked, 
            icon: const Icon(Icons.delete, color: Colors.red,)
          ),
        ),
      ),
    );
  }
}

List<Pancake> cakes=[
  Pancake( "Honey Pancake", "assets/cake_largest.png",),
  Pancake( "Canai Bread", "assets/cake_apple.png",),
  Pancake("Pie", "assets/Pie.png",),
  Pancake("Smoothies", "assets/orange.png",),
  Pancake("PanCake", "assets/pancake.png",),
  Pancake("Salmon", "assets/salmon.png",)
];

class Pancake{
  final String name;
  final String image;
  Pancake(this.name, this.image,);
}