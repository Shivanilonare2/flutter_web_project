import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/views/custom_widgets/constant_variables.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth > maxIPadWidth ){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        height: MediaQuery.of(context).size.height - 16,
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue
                                    )),
                                 const SizedBox(width: 10),
                                 const Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Shivani Lonare", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                                      Text("shivani.lonare98@gmail.com", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),)
                                    ],
                                  )
                                  ],
                                ),
                                Divider(color: Colors.grey.shade300, thickness: 1,),
                                SizedBox(
                                  height: 55,
                                  child: TextField(
                                    controller: TextEditingController(),
                                    decoration: InputDecoration(
                                      contentPadding:const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                      prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20,),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade400, width: 1)
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade400, width: 1)
                                      ),
                                      hintText: "Type here ..."
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 320,
                        height: MediaQuery.of(context).size.height - 16,
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            );
          }else{
            return Column(
              children: [

              ],
            );
          }

        }
      )
    );
  }
}
