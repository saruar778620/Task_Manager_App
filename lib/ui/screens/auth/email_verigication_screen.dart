import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/pin_verigication_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 180),
                  Text(
                    "Your Emal Address",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "A 6 digits verification pin will be sent to your email address",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEControler,
                    decoration: InputDecoration(hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapConfirmButton,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have account?",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                        children: [
                          TextSpan(
                            text: " Sign In",
                            style: TextStyle(color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSingInButton,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingInButton() {
    Navigator.pop((context));
  }

  void _onTapConfirmButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PinVerificationScreen()),
    );
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    super.dispose();
  }
}
