import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEControler = TextEditingController();

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
                    "Pin Verification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "A 6 digits verification pin has been sent to your email address",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  _buildPinCodeTextField(context),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: _onTapVerifyOtpButton, child: Text('Verify')),
                  SizedBox(height: 36),
                  Center(child: _buildSignInSection()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return RichText(
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
            recognizer: TapGestureRecognizer()..onTap = _onTapSingInButton,
          ),
        ],
      ),
    );
  }

  Widget _buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.themeColor,
      ),
      animationDuration: Duration(milliseconds: 300),
      keyboardType: TextInputType.number,
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _pinTEControler,
      appContext: context,
    );
  }

  void _onTapSingInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      ((route) => false),
    );
  }
  void _onTapVerifyOtpButton() {
   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
  }

  @override
  void dispose() {
    _pinTEControler.dispose();
    super.dispose();
  }
}
