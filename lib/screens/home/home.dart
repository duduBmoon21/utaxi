import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:utaxi/services/auth.dart';
import 'package:utaxi/services/database.dart';

class HomeS extends StatefulWidget {
  const HomeS({super.key});

  @override
  State<HomeS> createState() => _HomeSState();
}

class _HomeSState extends State<HomeS> {
  final _mapController = MapController();
//get Location
  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    
  }

  //firestore
  final FireStoreService fireStoreService = FireStoreService();

// text controller to access what the user typed
  final TextEditingController textEditingController = TextEditingController();

// open dialog box to create user
  void userBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textEditingController,
              ),
              actions: [
                //btn to save
                ElevatedButton(
                    onPressed: () {
                      //add new user
                      fireStoreService.addUser(textEditingController.text);
                      //to clear textcontroller
                      textEditingController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Add"))
              ],
            ));
  }

  Future<Position> _Location() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location is Denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location is disabled forver');
    }

    return await Geolocator.getCurrentPosition();
  }

  void userBox1() {}
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(user?.email ?? 'user email');
  }

  Widget _title() {
    return const Text('Titel');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sign Out '));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage('assets/car.png'),
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(onPressed: getLocation, child: Text('Get Loc')),
            Text(
              "Current Loation of the User",
              style: TextStyle(
                  color: Color(0xFF273671),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(
                        color: Color(0xFF8c8e98),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => _signOutButton()));
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                        color: Color(0xFF273671),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: userBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
