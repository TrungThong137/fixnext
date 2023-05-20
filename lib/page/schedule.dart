import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  DateTime selectedDate= DateTime.now();

  _selectCalendar(BuildContext context) async{
    final DateTime? picker=await showDatePicker(
      context: context, 
      initialDate: selectedDate, 
      firstDate: DateTime(1970), 
      lastDate: DateTime(2025)
    );
    if(picker != null && picker != selectedDate){
      setState(() {
        selectedDate=picker;
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
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),

                calendar(),
                const SizedBox(height: 30,),
                const Text("Time",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),

                dateTime(),
                const SizedBox(height: 30,),

                const Text(
                  "Details Workout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),

                detailsWorkout(
                  text:  "Choose Workout",
                  iconLeading: Icons.swap_vert_sharp,
                  textTraining: "Upperbody Workout"
                ),

                detailsWorkout(
                  text:  "Difficulity",
                  iconLeading: Icons.swap_vert_sharp,
                  textTraining: "Beginner"
                ),

                detailsWorkout(
                  text:  "Custom Repetitions",
                  iconLeading: Icons.insert_chart_outlined_outlined,
                ),

                detailsWorkout(
                  text:  "Custom Weights",
                  iconLeading: Icons.insert_chart_outlined_rounded,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 50),
                  child: InkWell(
                    onTap: (){},
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
                        "Save",
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
      ),
    );
  }

  Widget dateTime(){
    return InkWell(
      onTap: () {
        showCupertinoModalPopup(
          context: context, 
          builder: (BuildContext context)=>
           SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              initialDateTime: selectedDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date){
                setState(() {
                  selectedDate=date;  
                });
              }
            )  
          )       
        );
      },
      child: SizedBox(
        height: 100,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          initialDateTime: selectedDate,
          mode: CupertinoDatePickerMode.date,
          
          onDateTimeChanged: (DateTime date){
            setState(() {
              selectedDate=date;  
            });
          }
        )  
      ),
    );
  }

  Widget calendar(){
    return Column(
      children: [
        InkWell(
          onTap: ()=> _selectCalendar(context), 
          child: Row(
            children: [
              IconButton(
                onPressed: ()=> _selectCalendar(context), 
                icon: const Icon(Icons.calendar_month_outlined)
              ),
              Text("Thu, ${selectedDate.day} ${selectedDate.month} ${selectedDate.year}",
                 style: const TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.w500
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }

  Widget detailsWorkout({required text,required iconLeading,
    textTraining,}){
    return Padding(
      padding: const EdgeInsets.only(right: 25, top: 15),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(247, 248, 248, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Icon(iconLeading, color: const Color.fromRGBO(123, 111, 114, 0.7)),
            const SizedBox(width: 10,),
            Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(123, 111, 114, 1),
              ),
            ),
            
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textTraining??"",
                    style: const TextStyle(
                      fontSize: 13,
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
        "Add Schedule",
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

// Card(
//   elevation: 4,
//   margin: EdgeInsets.all(10),
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   child: Container(
//     padding: EdgeInsets.all(20),
//     margin: EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
//       image: DecorationImage(
//         image: NetworkImage('https://picsum.photos/500'),
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: ListTile(
//       leading: Image.network('https://picsum.photos/200'),
//       title: Text('Title', style: TextStyle(fontSize: 20)),
//       subtitle: Text('Subtitle', style: TextStyle(fontSize: 16)),
//       trailing: Icon(Icons.arrow_forward),
//       contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       dense: true,
//     ),
//   ),
// ),