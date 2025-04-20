import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Homefinal.dart';

class LoginOTP extends StatefulWidget {
  final String verificationId;

  const LoginOTP({super.key, required this.verificationId});

  @override
  _LoginOTPState createState() => _LoginOTPState();
}

class _LoginOTPState extends State<LoginOTP> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "AgriCare",
              style: TextStyle(
                fontFamily: 'times new roman',
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 300,
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter OTP",
                  hintStyle: TextStyle(color: Colors.black45),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              ),
              onPressed: () async {
                try {
                  final otpCode = otpController.text.trim();

                  if (otpCode.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter the OTP")),
                    );
                    return;
                  }

                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpCode,
                  );

                  await FirebaseAuth.instance.signInWithCredential(credential);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeFinal()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid OTP! Please try again.")),
                  );
                }
              },
              child: Text(
                "Verify OTP",
                style: TextStyle(
                  height: 3,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
