// import 'package:flutter/material.dart';
// import 'package:fyp/controller/auth/sign_up_controller.dart';
// import 'package:fyp/model/user_detail.dart';
// import 'package:fyp/repo/register_repo.dart';
// import 'package:fyp/utils/custom_snackbar.dart';
// import 'package:fyp/widgets/custom/custom_elevated_button.dart';
// import 'package:fyp/widgets/custom/custom_textfield.dart';
// import 'package:get/get.dart';

// class EditProfilePage extends StatefulWidget {
//   final Users user;

//   const EditProfilePage({super.key, required this.user});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneController;
//   late TextEditingController _addressController;
//   late TextEditingController _heightController;
//   late TextEditingController _weightController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.user.memberName);
//     _emailController = TextEditingController(text: widget.user.memberEmail);
//     _phoneController = TextEditingController(text: widget.user.memberPhone);
//     _addressController = TextEditingController(text: widget.user.memberAddress);
//     _heightController = TextEditingController(text: widget.user.memberHeight);
//     _weightController = TextEditingController(text: widget.user.memberWeight);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _heightController.dispose();
//     _weightController.dispose();
//     super.dispose();
//   }

//   void _updateUserDetails() {
//   final controller = Get.find<SignUpController>();
//   controller.memberNameController.text = _nameController.text;
//   controller.memberEmailController.text = _emailController.text;
//   controller.memberPhoneController.text = _phoneController.text;
//   controller.memberAddressController.text = _addressController.text;
//   controller.memberHeightController.text = _heightController.text;
//   controller.memberWeightController.text = _weightController.text;
//   controller.updateUserDetails(widget.user);
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               CustomTextField(
//                 controller: _nameController,
//                 hint: 'Name',
//                 textInputAction: TextInputAction.next,
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16.0), // Add some space (optional
//               CustomTextField(
//                 controller: _emailController,
//                 hint: 'Email',
//                 textInputAction: TextInputAction.next,
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16.0),
//               CustomTextField(
//                 controller: _phoneController,
//                 hint: 'Phone',
//                 textInputAction: TextInputAction.next,
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16.0),
//               CustomTextField(
//                 controller: _addressController,
//                 hint: 'Address',
//                 textInputAction: TextInputAction.next,
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16.0),
//               CustomTextField(
//                 controller: _heightController,
//                 hint: 'Height',
//                 textInputAction: TextInputAction.next,
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16.0),
//               CustomTextField(
//                 controller: _weightController,
//                 hint: 'Weight',
//                 textInputAction: TextInputAction.next,
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16.0),
//               CustomElevatedButton(
//                 onTap: () {
//                   _updateUserDetails();
//                 },
//                 title: 'Save',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _updateUserDetails() {
//     RegisterRepo.register(
//       memberName: _nameController.text,
//       memberEmail: _emailController.text,
//       memberPhone: _phoneController.text,
//       memberAddress: _addressController.text,
//       memberPassword: widget.user
//           .memberPassword!, // Assuming you don't want to update the password
//       memberHeight: _heightController.text,
//       memberWeight: _weightController.text,
//       memberType: widget.user.memberType.toString(),
//       onSuccess: (user, token) {
//         // Handle successful update
//         CustomSnackBar.success(
//             title: "Updated Successfully",
//             message: "User details updated successfully");
//         Get.back();
//         // Update the user object in your state management solution or navigate back to the previous page
//       },
//       onError: (message) {
//         // Handle error
//         CustomSnackBar.error(title: "Error", message: message);
//       },
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/controller/auth/sign_up_controller.dart';
import 'package:fyp/model/user_detail.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:fyp/widgets/custom/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final Users user;

  const EditProfilePage({super.key, required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;

  File? _profileImage;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.memberName);
    _emailController = TextEditingController(text: widget.user.memberEmail);
    _phoneController = TextEditingController(text: widget.user.memberPhone);
    _addressController = TextEditingController(text: widget.user.memberAddress);
    _heightController = TextEditingController(text: widget.user.memberHeight);
    _weightController = TextEditingController(text: widget.user.memberWeight);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : NetworkImage(widget.user.memberImageUrl ?? '')
                          as ImageProvider,
                  child: _profileImage == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 30,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _nameController,
                hint: 'Name',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _emailController,
                hint: 'Email',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _phoneController,
                hint: 'Phone',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _addressController,
                hint: 'Address',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _heightController,
                hint: 'Height',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _weightController,
                hint: 'Weight',
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              CustomElevatedButton(
                onTap: _updateUserDetails,
                title: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Inside the _EditProfilePageState class
  void _updateUserDetails() {
    final controller = Get.put(SignUpController());
    controller.memberNameController.text = _nameController.text;
    controller.memberEmailController.text = _emailController.text;
    controller.memberPhoneController.text = _phoneController.text;
    controller.memberAddressController.text = _addressController.text;
    controller.memberHeightController.text = _heightController.text;
    controller.memberWeightController.text = _weightController.text;
    // controller.memberId = widget.user.memberId;
    controller.updateUserDetails(widget.user);
  }
}
