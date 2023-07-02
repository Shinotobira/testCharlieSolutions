import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testcharliesolutions/features/home/domain/entities/user_entity.dart';

import '../bloc/profile_bloc/profile_bloc.dart';

class ModificationProfilePage extends StatefulWidget {
  const ModificationProfilePage({super.key, required this.user});

  final UserEntity user;
  @override
  State<ModificationProfilePage> createState() =>
      _ModificationProfilePageState();
}

class _ModificationProfilePageState extends State<ModificationProfilePage> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController ageController;
  late TextEditingController adresseController;

  bool isFormValid() {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        adresseController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.user.email);
    nameController = TextEditingController(text: widget.user.name);
    phoneController = TextEditingController(text: widget.user.phone);
    ageController = TextEditingController(text: widget.user.age.toString());
    adresseController = TextEditingController(text: widget.user.locations);
  }

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: screenHeight * 0.023,
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Modification du profile',
            style: TextStyle(fontSize: screenHeight * 0.025)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight * 0.80,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.008),
                child: Center(
                    child: SizedBox(
                  height: screenHeight * 0.695,
                  width: screenWidth * 0.80,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * 0.04),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.02,
                                bottom: screenHeight * 0.01),
                            child: Center(
                              child: Container(
                                width: screenHeight * 0.15,
                                height: screenHeight * 0.15,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: screenHeight * 0.1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                style:
                                    TextStyle(fontSize: screenHeight * 0.012),
                                decoration: InputDecoration(
                                  labelText: 'Nom, Prénom',
                                  labelStyle:
                                      TextStyle(fontSize: screenHeight * 0.014),
                                  errorStyle:
                                      TextStyle(fontSize: screenHeight * 0.014),
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
                                style:
                                    TextStyle(fontSize: screenHeight * 0.012),
                                decoration: InputDecoration(
                                    labelText: 'Numéro',
                                    labelStyle: TextStyle(
                                        fontSize: screenHeight * 0.015),
                                    errorStyle: TextStyle(
                                        fontSize: screenHeight * 0.015),
                                    errorText: phoneController.text.isNotEmpty
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
                                style:
                                    TextStyle(fontSize: screenHeight * 0.014),
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
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.012),
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          fontSize: screenHeight * 0.014),
                                      errorStyle: TextStyle(
                                          fontSize: screenHeight * 0.014),
                                      errorText: emailController.text.isNotEmpty
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
                                style:
                                    TextStyle(fontSize: screenHeight * 0.012),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: 'Adresse',
                                    labelStyle: TextStyle(
                                        fontSize: screenHeight * 0.014),
                                    errorStyle: TextStyle(
                                        fontSize: screenHeight * 0.014),
                                    errorText: adresseController.text.isNotEmpty
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
                            context.read<ProfileBloc>().add(GetMyUserEvent());
                            context.pushNamed('profile');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.025),
                            ),
                            minimumSize:
                                Size(screenWidth * 0.1, screenHeight * 0.055)),
                        child: Padding(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: Text('Valider',
                              style: TextStyle(fontSize: screenHeight * 0.025)),
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
    );
  }
}
