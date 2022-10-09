import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fy/database/databse_helper.dart';
import 'package:fy/utils/colors.dart';
import 'package:get/get.dart';

class AddChannelScreen extends StatefulWidget {
  const AddChannelScreen({super.key});

  @override
  State<AddChannelScreen> createState() => _AddChannelScreenState();
}

class _AddChannelScreenState extends State<AddChannelScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mobileBackground,
      appBar: AppBar(
        backgroundColor: mobileBackground,
        title: Row(
          children: const [
            Text(
              "# Add ",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Channel",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        ),
      ),
      body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SvgPicture.asset(
              'assets/images/channel.svg',
              height: 150,
              
            ),
            SizedBox(height: 60,),
              TextFormField(
                controller: _nameController,
                cursorColor: secondaryColor,
                style: TextStyle(color: secondaryColor),
                decoration: const InputDecoration(
                  hintText: "Enter channel's name",
                  hintStyle: TextStyle(color: secondaryColor),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _urlController,
                cursorColor: secondaryColor,
                style: TextStyle(color: secondaryColor),
                decoration: const InputDecoration(
                  hintText: "Enter channel's URL",
                  hintStyle: TextStyle(color: secondaryColor),
                  labelText: 'URL',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              ElevatedButton(onPressed: () async {
                setState(() {
                  _loading = true;
                });
                await DatabaseHelper.instance.insert({
                  'name': _nameController.text,
                  'url': _urlController.text
                });
                setState(() {
                  _loading = false;
                });
                Get.snackbar("Created!", "The channel has been created", backgroundColor: Colors.grey.shade500, colorText: Colors.black, icon: const Icon(Icons.done));
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(secondaryColor)
              ),              
              child: 
              _loading?
              const CircularProgressIndicator(color: Colors.white,)
              :
              const Text("Create Channel", style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
    );
  }
}
