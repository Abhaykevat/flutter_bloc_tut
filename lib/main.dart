import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/api_integration/get_request/post_bloc.dart';
import 'package:flutter_bloc_tut/api_integration/get_request/post_event.dart';
import 'package:flutter_bloc_tut/api_integration/get_request/post_page.dart';
import 'package:flutter_bloc_tut/api_integration/get_request/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home:BlocProvider(create: (context)=>PostBloc(PostRepository())..add(const FetchPosts()),child: PostPage(),),
      home: Builder(
        builder: (context) {
          return BlocProvider(
            create: (context) {
              final bloc = PostBloc(PostRepository());
              WidgetsBinding.instance.addPostFrameCallback((_) {
                bloc.add(const FetchPosts());
              });
              return bloc;
            },
            child: PostPage(),
          );
   },
),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'phone.dart'; 

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {



//   final List<Phone> phones = [
//     const Phone(phoneName: 'Samsung S20 FE 5G', phoneImage: 'assets/samsang.jpg'),
//     const Phone(phoneName: 'Iphone 11', phoneImage: 'assets/iphone11.jpg'),
//     const Phone(phoneName: 'Iphone 11', phoneImage: 'assets/iphone11.jpg'), 
//   ];

//   late List<Phone> uniquePhones;
//   Phone? selectedPhone1;
//   Phone? selectedPhone2;

//   @override
//   void initState() {
//     super.initState();
//     uniquePhones = phones.toSet().toList();

//     selectedPhone1 = uniquePhones[0];
//     selectedPhone2 = uniquePhones.length > 1 ? uniquePhones[1] : uniquePhones[0];
//   }

//   void comparePhones(BuildContext context) {
//     print("Selected 1 HashCode: ${selectedPhone1.hashCode}");
//     print("Selected 2 HashCode: ${selectedPhone2.hashCode}");

//     if (selectedPhone1 == selectedPhone2) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("✅ YES, They are EQUAL")),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("❌ NO, They are NOT EQUAL")),
//       );
//     }
//   }

//   Widget phoneDropdown({
//     required Phone? selectedPhone,
//     required Function(Phone?) onChanged,
//   }) {
//     return DropdownButton<Phone>(
//       value: selectedPhone,
//       items: uniquePhones.map((phone) {
//         return DropdownMenuItem(
//           value: phone,
//           child: Text(phone.phoneName),
//         );
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }

//   Widget phoneWidget(Phone phone) {
//     return Column(
//       children: [
//         Image.asset(phone.phoneImage, height: 120),
//         const SizedBox(height: 5),
//         Text(
//           phone.phoneName,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal[100],
//       appBar: AppBar(
//         backgroundColor: Colors.teal[700],
//         title: const Text("Equatable Phone Comparison"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             phoneDropdown(
//               selectedPhone: selectedPhone1,
//               onChanged: (value) => setState(() => selectedPhone1 = value),
//             ),
//             const SizedBox(height: 10),
//             phoneDropdown(
//               selectedPhone: selectedPhone2,
//               onChanged: (value) => setState(() => selectedPhone2 = value),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => comparePhones(context),
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//               child: const Text("Compare"),
//             ),
//             const SizedBox(height: 30),
//             if (selectedPhone1 != null) phoneWidget(selectedPhone1!),
//             const SizedBox(height: 20),
//             if (selectedPhone2 != null) phoneWidget(selectedPhone2!),
//           ],
//         ),
//       ),
//     );
//   }
  
// }
