import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/components/custom_button.dart';
import 'package:todoapp/features/Auth/cubit/auth_cubit.dart';
import 'package:todoapp/features/Auth/cubit/user_state.dart';
import 'package:todoapp/features/Auth/view/login_screen.dart';
import 'package:todoapp/features/Home/cubit/todo_cubit.dart';
import 'package:todoapp/features/Home/view/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: StreamBuilder(
          stream: context.watch<TodoCubit>().getTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.white),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return GestureDetector(
                      onLongPress: (){
                        context.read<TodoCubit>().delete(item.id);
                      },
                      child: Card(
                        color: Colors.grey,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                item.description,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
