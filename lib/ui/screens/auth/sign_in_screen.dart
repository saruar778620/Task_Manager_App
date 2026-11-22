import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/email_verigication_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEControler = TextEditingController();
  final TextEditingController _passwordTEControler = TextEditingController();

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
                    "Get Started With",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEControler,
                    decoration: InputDecoration(hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEControler,
                    decoration: InputDecoration(hintText: "Password"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: _onTapForgotPasswordButton,
                          child: Text("Forgot Password"),
                        ),
                        SizedBox(height: 5,),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4,
                            ),
                            children: [
                              TextSpan(
                                text: " Sign up",
                                style: TextStyle(color: AppColors.themeColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSingUpButton,
                              ),
                            ],
                          ),
                        ),
                      ],
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

  void _onTapSingUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _onTapForgotPasswordButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(),),);
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    _passwordTEControler.dispose();
    super.dispose();
  }
}
