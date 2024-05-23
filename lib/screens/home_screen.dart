import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utaxi/services/auth.dart';
import 'package:utaxi/services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: userBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
