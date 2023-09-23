// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:fitshare/Controllers/user_controller.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  TextEditingController userTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<ProviderStore>(
        builder: (context, providerStore, child) {
          return Column(
            children: [
              Expanded(
                child: Stepper(
                  type: StepperType.vertical,
                  currentStep: providerStore.stepperIndex,
                  onStepContinue: () {
                    if (providerStore.stepperIndex <= 0) {
                      providerStore
                          .handleIncrementStepper(providerStore.stepperIndex);
                    }
                  },
                  onStepCancel: () {
                    if (providerStore.stepperIndex > 0) {
                      providerStore
                          .handleDecrementStepper(providerStore.stepperIndex);
                    }
                  },
                  onStepTapped: (value) {
                    providerStore.handleTappedStepper(value);
                  },
                  steps: <Step>[
                    Step(
                      isActive: providerStore.stepperIndex >= 0,
                      title: Text("Personal Information"),
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "John Doe",
                                labelText: "Name",
                                icon: Icon(Ionicons.person_outline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: usernameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "JohnDoe",
                                labelText: "Username",
                                icon: Icon(Ionicons.person_outline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "JohnDoe@exmaple.com",
                                labelText: "Email",
                                icon: Icon(Ionicons.mail_outline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "John Doe",
                                labelText: "Password",
                                icon: Icon(Ionicons.person_outline),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      isActive: providerStore.stepperIndex >= 1,
                      title: Text("Additional Information"),
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: ageController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "25",
                                labelText: "Age",
                                icon: Icon(Ionicons.person_outline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: weightController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "60KG",
                                labelText: "Weight",
                                icon: Icon(Ionicons.mail_outline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: heightController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "160",
                                labelText: "Height",
                                icon: Icon(Ionicons.person_outline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: userTypeController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "normal / instructor",
                                labelText: "User Type",
                                icon: Icon(Ionicons.person_outline),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton.filled(
                  child: Text("Register"),
                  onPressed: () => UserController().handleUserRegistration(
                    nameController.text,
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                    ageController.text,
                    heightController.text,
                    weightController.text,
                    userTypeController.text,
                    context,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
