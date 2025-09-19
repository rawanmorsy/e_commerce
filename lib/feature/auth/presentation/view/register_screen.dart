import 'package:e_commerce/core/common/widget/custom_form_text_field.dart';
import 'package:e_commerce/core/dialogs/app_dialogs.dart';
import 'package:e_commerce/core/dialogs/app_toasts.dart';
import 'package:e_commerce/core/utils/validator_functions.dart';
import 'package:e_commerce/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(

      listener:(context, state) {
            if (state is RegisterError) {
              Navigator.pop(context);
              AppToast.showToast(
                context: context,
                title: 'Error',
                description: 'Error',
                type: ToastificationType.error,
              );
            }
            if (state is RegisterLoading) {
              AppDialogs.showLoadingDialog(context);
            }
            if (state is RegisterSuccess) {
               Navigator.pop(context);
              AppToast.showToast(
                context: context,
                title: 'Success',
                description: 'Success',
                type: ToastificationType.success,
              );
              
              
            }
          },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SignUp",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff1F1F1F),
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey
,          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                CustomTextFormField(
                  controller: emailController,
                  validator: Validator.validateEmail,
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  action: TextInputAction.next,
                ),
                SizedBox(height: 30),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                CustomTextFormField(
                  controller: passwordController,
                  validator: Validator.validatePassword,
                  hintText: "Enter your password",
                  isPassword: true,
                  keyboardType: TextInputType.emailAddress,
                  action: TextInputAction.next,
                ),
                SizedBox(height: 30),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  validator: (value) => Validator.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
                  hintText: "Enter your confirm password",
                  isPassword: true,
                  keyboardType: TextInputType.emailAddress,
                  action: TextInputAction.done,
                ),
                SizedBox(height: 30),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await BlocProvider.of<RegisterCubit>(context).register(
                        email: emailController.text,
                        password: passwordController.text,
                        // name: confirmPasswordController.text,
                      );
                    }
                  },
                  color: Color(0xff212121),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(fontSize: 14, color: Color(0xff6E6A7C)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pop();
                      },
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff212121),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }

  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
