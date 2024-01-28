import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  bool newChallenge = true;

  bool ownerVerifiable = false;

  List<DropdownMenuItem<String>> get dropDownItemTypes {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "walk",
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Walk"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "energy",
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Energy"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "organic",
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Organic"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: "localcommunitywaste",
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Local Community Waste"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
    ];
    return menuItems;
  }

  String selectedValue = "walk";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  @override
  void initState() {
    _nameController.text = "Walk to Work";
    _desController.text =
        "You have to walk to work or anywhere you prefer. Minimum distance is 5 kms to complete this";
    _numberController.text = "5 km";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: txt("Challenges", size: 20, weight: FontWeight.bold),
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: newChallenge
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      // obscureText: obsText,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey
                                  .shade400), // Change the border color on focus
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey
                                  .shade400), // Change the border color on focus
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _desController,
                      // obscureText: obsText,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      minLines: 5,
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey
                                  .shade400), // Change the border color on focus
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey
                                  .shade400), // Change the border color on focus
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        txt(
                          'Type',
                          color: Colors.black87,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedValue,
                        underline: null,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropDownItemTypes,
                        isExpanded: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _numberController,
                      // obscureText: obsText,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Number',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey
                                  .shade400), // Change the border color on focus
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey
                                  .shade400), // Change the border color on focus
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                      title: const Text('Owner Verifiable'),
                      selected: ownerVerifiable,
                      value: ownerVerifiable,
                      onChanged: (bool? newVal) {
                        if (newVal != null) {
                          setState(() {
                            ownerVerifiable = newVal;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          newChallenge = !newChallenge;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: txt("Make a challenge"),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        txt(
                          'Walk to Work',
                          size: 18,
                        ),
                        txt(
                          'You have to walk to work or anywhere you prefer. Minimum distance is 5 kms to complete this',
                          size: 13,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            txt(
                              'Type: Walking',
                              size: 13,
                            ),
                            txt(
                              'Ongoing',
                              size: 13,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        txt(
                          'Requests',
                          size: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            txt(
                              'kartikeypatel@gmail.com',
                              size: 13,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: txt(
                                'Accept',
                                size: 13,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
