import 'package:flutter/material.dart';

class Comparison extends StatefulWidget {
  const Comparison({super.key});

  @override
  State<Comparison> createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {

  DateTime selectDate = DateTime.now();

  _selectCalendar(BuildContext context) async{
    final DateTime? picker=await showDatePicker(
      context: context,
      initialDate: selectDate, 
      firstDate: DateTime(1970), 
      lastDate: DateTime(2025),
    );
    if(picker != null && picker != selectDate){
      setState(() {
        selectDate=picker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Column(
              children: [
                header(),
        
                calendar(
                  text: "Select Month 1",
                  textTraining: '${selectDate.month}'
                ),

                calendar(
                  text: "Select Month 2",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget calendar({text, textTraining}){
    return Padding(
      padding: const EdgeInsets.only(right: 25, top: 15),
      child: InkWell(
        onTap: ()=> _selectCalendar(context), 
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 248, 248, 1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10,),
              const Icon(Icons.calendar_month_outlined, color: Color.fromRGBO(123, 111, 114, 0.7)),
              const SizedBox(width: 10,),
              Text(
                text??"",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(123, 111, 114, 1),
                ),
              ),
              
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textTraining??"Select Month",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(173, 164, 165, 1)
                      ),
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.arrow_forward_ios, 
                      color: Color.fromRGBO(173, 164, 165, 1),
                      size: 20,
                      )
                    )
                  ],
                ),
              ),
          
            ],
          ),
        ),
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
          color: const Color.fromRGBO(247, 248, 248, 1),
          borderRadius: BorderRadius.circular(3)
        ),
        child: IconButton(
          onPressed: (){},
          padding: const EdgeInsets.only(bottom: 1),
          icon: const Icon(Icons.arrow_back_ios_new, size: 15, color: Colors.black,)
        ),
      ),
  
      title: const Text(
        "Comparison",
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
          color: const Color.fromRGBO(247, 248, 248, 1),
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
}