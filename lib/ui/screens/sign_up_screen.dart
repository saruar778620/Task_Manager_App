import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEControler = TextEditingController();
  final TextEditingController _firstNamTEControler = TextEditingController();
  final TextEditingController _lastNameTEControler = TextEditingController();
  final TextEditingController _mobileTEControler = TextEditingController();
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
                    "Join with us",
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
                    controller: _firstNamTEControler,
                    decoration: InputDecoration(hintText: "First Name"),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEControler,
                    decoration: InputDecoration(hintText: "Last Name"),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileTEControler,
                    decoration: InputDecoration(hintText: "Mobile"),
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
                  _buildBackToSignInSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _buildBackToSignInSection() {
    return Center(
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
              text: " Sign in",
              style: TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()..onTap = _onTabSingIn,
            ),
          ],
        ),
      ),
    );
  }

  void _onTabSingIn() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    _firstNamTEControler.dispose();
    _lastNameTEControler.dispose();
    _mobileTEControler.dispose();
    _passwordTEControler.dispose();
    super.dispose();
  }
}
