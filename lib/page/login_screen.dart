import 'package:flutter/material.dart';
import 'package:vr_web_admin/generated/l10n.dart';

abstract class ILoginViewModel extends ChangeNotifier {
  String? get passwordErrorMessage;
  String? get emailErrorMessage;
  bool get isLoading;
  String? get errorMessage;
  void passwordChanged(String newPassword);
  void loginUser();
  void emailChanged(String newEmail);
}

class LoginScreen extends StatelessWidget {
  final ILoginViewModel _viewModel;
  const LoginScreen(this._viewModel, {super.key});

  _loggedInButtonPressed() {
    _viewModel.loginUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VR WEB ADMIN"),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
            animation: _viewModel,
            builder: (context, child) {
              final errorMessage = _viewModel.errorMessage;
              return Column(
                children: [
                  TextFormField(
                    onChanged: _viewModel.emailChanged,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [
                      AutofillHints.username,
                      AutofillHints.email
                    ],
                    decoration: InputDecoration(
                        hintText: "admin@example.com",
                        labelText: "Email",
                        errorText: _viewModel.emailErrorMessage),
                  ),
                  TextFormField(
                    onChanged: _viewModel.passwordChanged,
                    obscureText: true,
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: _viewModel.passwordErrorMessage),
                  ),
                  const SizedBox(height: 8),
                  if (_viewModel.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Center(
                      child: ElevatedButton(
                          onPressed: _loggedInButtonPressed,
                          child: Text(
                            S.of(context).login,
                            style: const TextStyle(fontSize: 15),
                          )),
                    ),
                  if (errorMessage != null) Text(errorMessage)
                ],
              );
            }),
      ),
    );
  }
}
