import 'package:blodbank/core/ReusableCompounds/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';

class NewPassword extends StatefulWidget {
  static String id = "NewPassword";
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  void _changePassword() {
    String password = _passwordController.text.trim();
    String confirm = _confirmController.text.trim();

    if (password.isEmpty || confirm.isEmpty) {
      _showError('يرجى ملء جميع الحقول');
      return;
    }

    if (password != confirm) {
      _showError('كلمة المرور وتأكيدها غير متطابقين');
      return;
    }

    if (password.length < 6) {
      _showError('كلمة المرور يجب أن تكون 6 أحرف على الأقل');
      return;
    }
    _showSuccessDialog();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'Assets/images/new_password.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'تم تغيير كلمة المرور',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'تم تغيير كلمة المرور الخاصة بك بنجاح',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "كلمة مرور جديدة",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'Assets/images/new_password.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: Text(
                        'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمات المرور السابقة المستخدمة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'كلمة المرور الجديدة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        CustomTextField(
                          hintText: 'ادخل كلمة المرور',
                          obscureText: _obscurePassword,
                          controller: _passwordController,
                          icon: null,
                        ),
                        Positioned(
                          left: 6,
                          child: IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'تأكيد كلمة المرور',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        CustomTextField(
                          hintText: 'ادخل كلمة المرور الجديدة',
                          obscureText: _obscureConfirm,
                          controller: _confirmController,
                          icon: null,
                        ),
                        Positioned(
                          left: 6,
                          child: IconButton(
                            splashRadius: 20,
                            icon: Icon(
                              _obscureConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirm = !_obscureConfirm;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'تغير كلمه المرور',
                      onPressed: _changePassword,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
