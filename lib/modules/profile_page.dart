import 'package:flutter/material.dart';
import '../layout/login_page_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;
  final TextEditingController nameController =
      TextEditingController(text: 'Omar');
  final TextEditingController ageController = TextEditingController(text: '22');
  final TextEditingController phoneController =
      TextEditingController(text: '12345675');
  final TextEditingController emailController =
      TextEditingController(text: 'omar@gmail.com');
  final TextEditingController genderController =
      TextEditingController(text: 'Male');

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    emailController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF161E36),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              _showPopupMenu(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileInfo('Name', nameController),
            const SizedBox(height: 20),
            _buildProfileInfo('Age', ageController),
            const SizedBox(height: 20),
            _buildProfileInfo('Phone', phoneController),
            const SizedBox(height: 20),
            _buildProfileInfo('Email', emailController),
            const SizedBox(height: 20),
            _buildProfileInfo('Gender', genderController),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    // Implement save logic here
                    // Show alert message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Saved'),
                          content: const Text('Changes saved successfully.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );

                    setState(() {
                      isEditing = false;
                    });
                  } else {
                    setState(() {
                      isEditing = true;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFFFF8B3D)),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                child: Text(
                  isEditing ? 'Save' : 'Edit',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(
          1000, 80, 0, 0), // position of the popup menu
      items: [
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Log out'),
        ),
      ],
    ).then((String? value) {
      if (value == 'logout') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenLayout()),
        );
      }
    });
  }

  Widget _buildProfileInfo(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter $label',
                ),
              )
            : Text(
                controller.text,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}
