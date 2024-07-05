import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/features/home/domain/usecase/user_usecase.dart';
import 'package:assignment/features/home/presentation/pages/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment/features/home/domain/entity/user_entity.dart';

class CustomCard extends StatelessWidget {
  final List<UserEntity> userList;
  final int index;
  //final Function(int) onDelete; // Callback function to delete item
  final String documentId;
  const CustomCard({
    Key? key,
    required this.userList,
    required this.index,
    required this.documentId,
    // required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 209, 216, 240),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black,
                blurStyle: BlurStyle.normal,
                offset: Offset(1, 1))
          ]),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Name: ${userList[index].firstName}',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xff626262),
              ),
            ),
            Text(
              'Last Name: ${userList[index].lastName}',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xff626262),
              ),
            ),
            Text(
              'Email: ${userList[index].email}',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xff626262),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Color(0xff626262),
                    size: 21,
                  ),
                  onPressed: () {
                    _showEditDialog(context);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color(0xff626262),
                    size: 21,
                  ),
                  onPressed: () {
                    _showDeleteDialog(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete this item?'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                locator<UserUsecase>().deleteUserUsecase(
                    documentId); // Call onDelete callback with index
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return EditScreen(
          index: index,
          userList: userList,
        );
      },
    ));
  }
}
