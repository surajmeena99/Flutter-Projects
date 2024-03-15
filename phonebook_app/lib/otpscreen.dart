import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phonebook_app/location_screen.dart';

class OTPScreen extends StatefulWidget {
  final String verificationid;
  const OTPScreen({super.key, required this.verificationid});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: "Enter The OTP",
                suffixIcon: const Icon(Icons.phone)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () async{
              try {
                PhoneAuthCredential credential = await PhoneAuthProvider.credential(
                  verificationId: widget.verificationid,
                  smsCode: otpController.text.toString(),
                );
                FirebaseAuth.instance.signInWithCredential(credential).then((value) => 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationScreen()))
                );
              } catch (exception) {
                print(exception); 
              }
            },
            child: const Text("Verify Phone Number"),
          )
        ],
      ),
    );
  }
}