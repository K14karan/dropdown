import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:travel_context/homescreen/visa/visa_form.dart';
import '../../theme/color.dart';
class VisaPage extends StatefulWidget {
  const VisaPage({Key? key}) : super(key: key);

  @override
  State<VisaPage> createState() => _VisaPageState();
}

class _VisaPageState extends State<VisaPage> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    dateinput1.text = "";//set the initial value of text field
    super.initState();
  }
  int adult=1;
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visa',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: DropdownButtonFormField<String>(
                key: UniqueKey(),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    labelText: ('To'),
                    labelStyle: GoogleFonts.roboto(fontSize: 12),
                    contentPadding: EdgeInsets.only(top: 10, left: 10)),
                value: dropdownValue,
                items: [
                  DropdownMenuItem<String>(
                    value: "1",
                    child: Text("	Afghanistan"),
                  ),
                  DropdownMenuItem<String>(
                    value: "2",
                    child: Text("France"),
                  ),
                  DropdownMenuItem<String>(
                    value: "3",
                    child: Text("Morocco"),
                  ),
                ],
                onChanged: (String? newStateId) {
                  setState(() {
                    dropdownValue = newStateId!;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:20,top: 10,right: 20),
              height: 50,

              width: double.infinity,
              child: TextField(
                controller: dateinput,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    labelText: ('From'),
                    labelStyle: GoogleFonts.roboto(fontSize: 16),
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                    ),
                    contentPadding: EdgeInsets.only(top: 10, left: 10)),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);

                    setState(() {
                      dateinput.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ),
            Container(
               margin: EdgeInsets.only(left:20,top: 10,right: 20),
              height: 50,

              width: double.infinity,
              child: TextField(

                controller: dateinput1,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    labelText: ('To'),
                    labelStyle: GoogleFonts.roboto(fontSize: 16),
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                    ),
                    contentPadding: EdgeInsets.only(top: 10, left: 10)),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);

                    setState(() {
                      dateinput1.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Container(
                    padding:EdgeInsets.only(top:5),
                      child: Text('TRAVELLERS ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold),)),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('No. of Travellers',style: GoogleFonts.roboto(),),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.grey),
                              borderRadius: BorderRadius.circular(0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: (){
                                    if(adult>0){
                                      setState(() {
                                        adult--;
                                      });
                                    }
                                  },

                                  child: Icon(Icons.remove,color: Colors.grey,)),
                              Text(
                                adult.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),

                              InkWell(
                                  onTap: (){
                                    if(adult<10){
                                      setState(() {
                                        adult++;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.add,color: Colors.grey,))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                  Get.to(VisaForm());
              },
              child: Container(
                alignment: Alignment.center,
                margin:EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('Search',style: GoogleFonts.viga(color: Colors.white,fontSize: 16),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
