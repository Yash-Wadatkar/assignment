import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/core/widgets/custom_button.dart';
import 'package:assignment/features/home/domain/entity/user_entity.dart';
import 'package:assignment/features/home/domain/usecase/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditScreen extends StatelessWidget {
  final List<UserEntity> userList;
  final int index;
  const EditScreen({super.key, required this.userList, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController =
        TextEditingController(text: userList[index].firstName);
    final TextEditingController lastNameController =
        TextEditingController(text: userList[index].lastName);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Expanded(flex: 50, child: SizedBox()),
            TextFormField(
              controller: firstNameController,
              cursorColor: const Color(0xff1F41BB),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Name is required';
                }
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1F41BB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: const Color(0xffF1F4FF),
                  hintText: userList[index].firstName,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff626262)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const Expanded(flex: 20, child: SizedBox()),
            TextFormField(
              controller: lastNameController,
              cursorColor: const Color(0xff1F41BB),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last Name is required';
                }
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1F41BB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: const Color(0xffF1F4FF),
                  hintText: userList[index].lastName,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff626262)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const Expanded(flex: 50, child: SizedBox()),
            CustomButton(
                text: 'Update',
                color: const Color(0xff1F41BB),
                onpress: () async {
                  try {
                    await locator<UserUsecase>().updateUserUsecase(
                        userList[index].email,
                        UserEntity(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: userList[index].email));

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.greenAccent,
                      content: Text('Data Updated successfuly'),
                      duration: Duration(seconds: 2),
                    ));
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                          'Data not Updated : error occurs ${e.toString()}'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                foreGroundColor: Colors.white),
            const Expanded(flex: 470, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
