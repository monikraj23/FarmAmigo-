import 'package:flutter/material.dart';
import 'package:impciker/home_screen.dart';

class HomeFinal extends StatelessWidget {
  const HomeFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: [
              AppBar(
                title: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        "Hello Monik,",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(240, 255, 255, 255),
                            fontSize: 25,
                            fontFamily: "Canva sans"),
                      ),
                    ),
                    Text(
                      "Its a sunny day!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                centerTitle: false,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
              ),
              Container(
                padding: EdgeInsets.only(left: 17),
                width: 420,
                height: 24,
                color: Color.fromARGB(255, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                ),
              )
            ],
          )),
      backgroundColor: Color.fromARGB(255, 208, 246, 209),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //container 1 - Temp,hum,etc - white box
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(20),
              //Temperature and Humidity - row
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        //temperature and Rainfall - Column
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(padding: EdgeInsets.all(15)),
                            Row(
                              children: [
                                Icon(Icons.thermostat),
                                Padding(padding: EdgeInsets.only(right: 5)),
                                Text(
                                  "Temperature",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Row(
                              children: [
                                Icon(Icons.water_drop),
                                Padding(padding: EdgeInsets.only(right: 5)),
                                Text("Rainfall",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      //Humidity, windspeed container
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(padding: EdgeInsets.all(15)),
                            Row(
                              children: [
                                Icon(Icons.water_sharp),
                                Padding(padding: EdgeInsets.only(right: 5)),
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Row(
                              children: [
                                Icon(Icons.air),
                                Padding(padding: EdgeInsets.only(right: 5)),
                                Text("Windspeed",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  SizedBox(
                    width: 300,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll<Color>(Colors.black)),
                        onPressed: () {
                          print("pressed button");
                        },
                        child: Text("Click to see next 7 days forecast",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(210, 255, 255, 255),
                              letterSpacing: 1.5,
                            ))),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 13)),
                ],
              ),
            ),

            //container 2 - Plant tips
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Seasonal Plant Care Tips",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(15)),
                          width: 190,
                          height: 170,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 35)),
                                  Icon(
                                    Icons.snowing,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 5)),
                                  Text(
                                    "Winter",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                              Text(
                                "Choose Cold-Tolerant Plants: Opt for winter-friendly plants like kale, spinach, pansies, or evergreen shrubs. These thrive in lower temperatures and require minimal maintenance",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(15)),
                          width: 190,
                          height: 170,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 35)),
                                  Icon(Icons.sunny),
                                  Padding(padding: EdgeInsets.only(right: 5)),
                                  Text(
                                    "Summer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                              Text(
                                "Water Consistently and Deeply: Water plants early in the morning or late evening to prevent evaporation. Focus on deep watering to encourage strong root growth.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(15)),
                          width: 190,
                          height: 170,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 35)),
                                  Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 5)),
                                  Text(
                                    "Monsoon",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                              Text(
                                "Choose Cold-Tolerant Plants: Opt for winter-friendly plants like kale, spinach, pansies, or evergreen shrubs. These thrive in lower temperatures and require minimal maintenance",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(15)),
            SizedBox(
              width: 300,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                          const Color.fromARGB(255, 52, 137, 55))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text("Click to find the Plant - Disease",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(210, 255, 255, 255),
                              letterSpacing: 1.5,
                            )),
                      ],
                    ),
                  )),
            ),
            Padding(padding: EdgeInsets.only(bottom: 13)),

            //container 3 - plant disease overlook
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Regional Plant Disease Outbreak",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15)),
                    width: 190,
                    height: 170,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 35)),
                            Icon(
                              Icons.snowing,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              "Winter",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          "Choose Cold-Tolerant Plants: Opt for winter-friendly plants like kale, spinach, pansies, or evergreen shrubs. These thrive in lower temperatures and require minimal maintenance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15)),
                    width: 190,
                    height: 170,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 35)),
                            Icon(Icons.sunny),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              "Summer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          "Water Consistently and Deeply: Water plants early in the morning or late evening to prevent evaporation. Focus on deep watering to encourage strong root growth.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15)),
                    width: 190,
                    height: 170,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 35)),
                            Icon(
                              Icons.cloud,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              "Monsoon",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          "Choose Cold-Tolerant Plants: Opt for winter-friendly plants like kale, spinach, pansies, or evergreen shrubs. These thrive in lower temperatures and require minimal maintenance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.camera_alt),
          color: Colors.black,
          iconSize: 40,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 60,
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              height: 40,
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.history, color: Colors.white),
              ),
            )),
            Expanded(
                child: SizedBox(
              height: 40,
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
              ),
            )),
            Expanded(
                child: SizedBox(
              height: 40,
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.person, color: Colors.white),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
