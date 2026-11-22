import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEControler = TextEditingController();
  final TextEditingController _confirmpasswordTEControler = TextEditingController();

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
                    "Set Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Minimum length of password should be more than 6 letters and combination of numbers and letters",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _passwordTEControler,
                    decoration: InputDecoration(hintText: "Password"),
                    keyboardType: TextInputType.number
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _confirmpasswordTEControler,
                    decoration: InputDecoration(hintText: "Confirm Password"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapConfirmButton,
                    child: Text('Confirm')
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      ((route) => false),
    );
  }

  void _onTapConfirmButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      ((route) => false),
    );
  }


  @override
  void dispose() {
    _passwordTEControler.dispose();
    _confirmpasswordTEControler.dispose();
    super.dispose();
  }
}
