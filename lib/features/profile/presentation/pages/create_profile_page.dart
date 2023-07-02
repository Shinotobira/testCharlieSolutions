import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../home/domain/entities/user_entity.dart';
import '../bloc/profile_bloc/profile_bloc.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController adresseController = TextEditingController();

  bool isFormValid() {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        adresseController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.1),
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight * 0.80,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.008),
                    child: Center(
                        child: SizedBox(
                      height: screenHeight * 0.60,
                      width: screenWidth * 0.80,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: TextFormField(
                                    controller: nameController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.012),
                                    decoration: InputDecoration(
                                      labelText: 'Nom, Prénom',
                                      labelStyle: TextStyle(
                                          fontSize: screenHeight * 0.014),
                                      errorStyle: TextStyle(
                                          fontSize: screenHeight * 0.014),
                                      errorText: nameController.text.isNotEmpty
                                          ? null
                                          : 'Ce champ est requis',
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.012),
                                    decoration: InputDecoration(
                                        labelText: 'Numéro',
                                        labelStyle: TextStyle(
                                            fontSize: screenHeight * 0.015),
                                        errorStyle: TextStyle(
                                            fontSize: screenHeight * 0.015),
                                        errorText:
                                            phoneController.text.isNotEmpty
                                                ? null
                                                : 'Ce champ est requis'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: TextFormField(
                                    controller: ageController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.014),
                                    decoration: InputDecoration(
                                        labelText: 'Age',
                                        labelStyle: TextStyle(
                                            fontSize: screenHeight * 0.014),
                                        errorStyle: TextStyle(
                                            fontSize: screenHeight * 0.014),
                                        errorText: ageController.text.isNotEmpty
                                            ? null
                                            : 'Ce champ est requis'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontSize: screenHeight * 0.012),
                                      decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                              fontSize: screenHeight * 0.014),
                                          errorStyle: TextStyle(
                                              fontSize: screenHeight * 0.014),
                                          errorText:
                                              emailController.text.isNotEmpty
                                                  ? null
                                                  : 'Ce champ est requis')),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: TextFormField(
                                    controller: adresseController,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.012),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        labelText: 'Adresse',
                                        labelStyle: TextStyle(
                                            fontSize: screenHeight * 0.014),
                                        errorStyle: TextStyle(
                                            fontSize: screenHeight * 0.014),
                                        errorText:
                                            adresseController.text.isNotEmpty
                                                ? null
                                                : 'Ce champ est requis'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print("test");
                              if (isFormValid()) {
                                UserEntity user = UserEntity(
                                    id: '1',
                                    age: int.parse(ageController.text),
                                    picture: '',
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    locations: adresseController.text,
                                    email: emailController.text);

                                context
                                    .read<ProfileBloc>()
                                    .add(SendMyUserEvent(userEntity: user));
                                context.pushNamed('home');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      screenHeight * 0.025),
                                ),
                                minimumSize: Size(
                                    screenWidth * 0.1, screenHeight * 0.055)),
                            child: Padding(
                              padding: EdgeInsets.all(screenHeight * 0.01),
                              child: Text('Créer votre compte',
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.025)),
                            ),
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
}
