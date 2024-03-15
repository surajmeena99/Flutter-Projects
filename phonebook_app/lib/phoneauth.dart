import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phonebook_app/otpscreen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Auth"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: "Enter Phone Number",
                suffixIcon: const Icon(Icons.phone),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () async{
              await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential){}, 
                verificationFailed: (FirebaseAuthException exception){}, 
                codeSent: (String verificationid, int? resendtoken){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => OTPScreen(verificationid: verificationid,))
                  );
                }, 
                codeAutoRetrievalTimeout: (String verificationId){},
                phoneNumber: phoneController.text.toString(),
              );
            },
            child: const Text("Verify Phone Number"),
          )
        ],
      ),
    );
  }
}