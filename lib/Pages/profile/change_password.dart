import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/firebase_helper/firebase_auth.dart';
import 'package:shop_app/model/usermodel.dart';
import 'package:shop_app/widgets/dimensions.dart';
import '../../provider/app_provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool obscureCurrentPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildPasswordField(
              controller: currentpassword,
              hintText: "Current Password",
              obscureText: obscureCurrentPassword,
              onChanged: (text) {
                // Handle current password changes if needed
              },
              onTogglePressed: () {
                setState(() {
                  obscureCurrentPassword = !obscureCurrentPassword;
                });
              },
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            _buildPasswordField(
              controller: newpassword,
              hintText: "New Password",
              obscureText: obscureNewPassword,
              onChanged: (text) {
                // Handle new password changes if needed
              },
              onTogglePressed: () {
                setState(() {
                  obscureNewPassword = !obscureNewPassword;
                });
              },
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            _buildPasswordField(
              controller: confirmpassword,
              hintText: "Confirm Password",
              obscureText: obscureConfirmPassword,
              onChanged: (text) {
                
              },
              onTogglePressed: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            InkWell(
              onTap: () async {
                if (currentpassword.text.isEmpty) {
                  ShowMessage("Enter current password");
                } else if (newpassword.text.isEmpty) {
                  ShowMessage("Enter new password");
                } else if (confirmpassword.text.isEmpty) {
                  ShowMessage("Enter confirm password");
                } else if (newpassword.text.length < 8) {
                  ShowMessage("New password is too short");
                } else if (confirmpassword.text != newpassword.text) {
                  ShowMessage('Confirm password does not match');
                } else {
                  // Call the changePassword function with current password, new password, and context
                  UserModel userModel = appProvider.getUserInformation.copyWith(password: newpassword.text);
                  appProvider.updatePasswordinfoFirebase(context, userModel);
                  FirebaseAuthHelper.instance.changePassword(
                    currentpassword.text,
                    newpassword.text,
                    context,
                  );
                }
              },
              child: Container(
                height: Dimensions.height40,
                width: Dimensions.width150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.purple,
                ),
                child: const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required ValueChanged<String> onChanged,
    required VoidCallback onTogglePressed,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.password_sharp),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onTogglePressed,
        ),
      ),
    );
  }
}
