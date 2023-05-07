import 'package:flutter/material.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/splashScreen/splash_screen.dart';


class MyDrawer extends StatefulWidget
{
  //to get mail and name
  String? name;
  String? email;

  MyDrawer({this.name, this.email});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}



class _MyDrawerState extends State<MyDrawer>
{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        children: [
          //drawer header
          Container(
            height: 165,
            color: Colors.grey,
            
            //Drawer Header
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 24, 24, 24)),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),

                  const SizedBox(width: 16,),
                 // Name and Email
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        widget.email.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const  SizedBox(height: 12.0,),

          //drawer body
          GestureDetector(
            onTap: ()
            {

            },
            child: const ListTile(
              leading: Icon(Icons.history, color: Color.fromARGB(255, 0, 0, 0),),
              title: Text(
                "History",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
            ),
          ),
  
           const  SizedBox(height: 12.0,),

        
          GestureDetector(
            onTap: ()
            {

            },
            child: const ListTile(
              leading: Icon(Icons.person, color: Color.fromARGB(255, 12, 12, 12),),
              title: Text(
                "Visit Profile",
                style: TextStyle(
                    color: Color.fromARGB(255, 17, 17, 17)
                ),
              ),
            ),
          ),
           
          const  SizedBox(height: 12.0,),

          GestureDetector(
            onTap: ()
            {

            },
            child: const ListTile(
              leading: Icon(Icons.info, color: Color.fromARGB(255, 12, 12, 12),),
              title: Text(
                "About",
                style: TextStyle(
                    color: Color.fromARGB(255, 7, 7, 7)
                ),
              ),
            ),
          ),

          const  SizedBox(height: 12.0,),

          GestureDetector(
            onTap: ()
            {
              fAuth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
            },
            child: const ListTile(
              leading: Icon(Icons.logout, color: Color.fromARGB(255, 0, 0, 0),),
              title: Text(
                "Sign Out",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
