import 'package:auto_route/auto_route.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isFirstPasswordHidden = true;
  bool isSecondPasswordHidden = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController userNameTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();
    userNameTextInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Зарегистрироваться'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                TextFormField(
                  controller: emailTextInputController,
                  // validator: () {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Введите Email',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: userNameTextInputController,
                  // validator: () {},
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Введите никнейм',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите никнейм';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: isFirstPasswordHidden,
                  autocorrect: false,
                  controller: passwordTextInputController,
                  validator: (value) => value != null && value.length < 6
                      ? 'Минимум 6 символов'
                      : null,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(isFirstPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Введите пароль'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: isSecondPasswordHidden,
                  autocorrect: false,
                  controller: passwordTextRepeatInputController,
                  validator: (value) => value != null && value.length < 6
                      ? 'Минимум 6 символов'
                      : null,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(isSecondPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Введите пароль еще раз'),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      context.maybePop();
                    } else if (state is RegisterError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Ошибка регистрации: неизвестная ошибка"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AuthCubit>().register(UserModel(
                                  email: emailTextInputController.text,
                                  password: passwordTextInputController.text,
                                  name: UserNameModel(
                                    firstname: userNameTextInputController.text,
                                  ),
                                ));
                          }
                        },
                        child: state is RegisterLoading
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Регистрация',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
