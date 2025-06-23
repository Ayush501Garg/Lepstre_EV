// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lepster/screens/auth_screen/otp_verify_screen.dart';
//
// import '../../core/constants/app_color.dart';
// import '../../core/constants/image_path.dart';
//
// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Container(
//               height: 220,
//               decoration: const BoxDecoration(
//                 color: AppColors.primaryColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40),
//                   bottomRight: Radius.circular(40),
//                 ),
//               ),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         ),
//
//                       ],
//                     ),
//
//                    Center(child:  Text(
//                      'Lepster ⚡ EV',
//                      style: TextStyle(
//                        fontSize: 24,
//                        fontWeight: FontWeight.bold,
//                        letterSpacing: 2,
//                        color: Colors.white
//                      ),
//                    ),),
//
//                    const Expanded(child: SizedBox()),
//                    // e space le lega
//                     const Padding(
//                       padding: EdgeInsets.only(bottom: 12),  // bottom padding for TabBar
//                       child: TabBar(
//                         indicatorColor: Colors.white,
//                         indicatorWeight: 2,    // small underline
//                         labelColor: Colors.white,
//                         unselectedLabelColor: Colors.white60,
//                         indicatorSize: TabBarIndicatorSize.label,
//                         dividerColor: Colors.transparent,   // // only below selected label
//                         tabs: [
//                           Tab(text: 'Sign Up'),
//                           Tab(text: 'Sign In'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   // Sign Up Tab
//                   Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 20),
//                           const Text(
//                             'Create An Account',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.primaryColor,
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           _buildTextField(Icons.person, 'Full Name'),
//                           const SizedBox(height: 16),
//                           _buildTextField(Icons.email, 'Email'),
//                           const SizedBox(height: 16),
//                           _buildTextField(Icons.lock, 'Password', isPassword: true),
//                           const SizedBox(height: 24),
//                           _buildButton('Sign Up',(){
//                             Navigator.push(context, MaterialPageRoute(builder: (_) => OTPVerificationScreen()));
//                           }),
//                           const SizedBox(height: 24),
//                           const Center(child: Text('Or sign up with')),
//                           const SizedBox(height: 16),
//                           _buildSocialRow(),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   // Sign In Tab
//                   Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 20),
//                           const Text(
//                             'Welcome Back !',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.primaryColor,
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           _buildTextField(Icons.email, 'Email'),
//                           const SizedBox(height: 16),
//                           _buildTextField(Icons.lock, 'Password', isPassword: true),
//                           const SizedBox(height: 8),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Flexible(
//                                 child: Row(
//                                   children: [
//                                     Checkbox(value: false, onChanged: (value) {}),
//                                     const Flexible(
//                                       child: Text(
//                                         'Remember Password',
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Forget Password?',
//                                   style: TextStyle(color: Colors.red),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           const SizedBox(height: 16),
//                           _buildButton('Sign In',(){
//                             Navigator.push(context, MaterialPageRoute(builder: (_) => OTPVerificationScreen()));
//                           }),
//                           const SizedBox(height: 24),
//                           const Center(child: Text('Or sign in with')),
//                           const SizedBox(height: 16),
//                           _buildSocialRow(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(IconData icon, String hint, {bool isPassword = false}) {
//     return TextField(
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon),
//         suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
//         hintText: hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButton(String text, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 50,
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//
//         Expanded(
//           child: Container(
//             height: 50,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.primaryColor),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.network('https://tse3.mm.bing.net/th?id=OIP.aPyHWMu3KHjwJUWdGrEkZQHaHa&pid=Api&P=0&h=180', height: 24),
//                 const SizedBox(width: 8),
//                 const Text('Google'),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             height: 50,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.primaryColor),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.network('https://tse3.mm.bing.net/th?id=OIP.aubU2lXxC1ZmPDdf-koomwHaH_&pid=Api&P=0&h=180', height: 24),
//                 const SizedBox(width: 8),
//                 const Text('Facebook'),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }