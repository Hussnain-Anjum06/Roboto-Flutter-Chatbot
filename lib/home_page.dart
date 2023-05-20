import 'package:flutter/material.dart';
import 'package:chatbot/chat_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Color.fromRGBO(119, 89, 255, 1)],
          ),
        ),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 75),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, I'm ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Roboto",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Stack(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Color.fromARGB(255, 220, 208, 243),
                      backgroundImage: AssetImage('assets/images/bot.jpg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(120, 120, 0, 0),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(7, 3, 0, 0),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 2, 0, 0),
                          child: Image(
                            image: AssetImage('assets/images/icon.png'),
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                "How can I help you?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(248, 255, 255, 255),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "I want to know",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "developed by ",
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "M Hussnain Anjum",
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 250, 249, 247),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.github),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
