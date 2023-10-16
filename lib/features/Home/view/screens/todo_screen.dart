import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/components/custom_button.dart';
import 'package:todoapp/features/Home/cubit/todo_cubit.dart';
import 'package:todoapp/features/Home/model/todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'description',
              ),
              maxLines: 5,
            ),
            const Spacer(),
            BlocListener<TodoCubit, TodoState>(
              listener: (context, state) {
                if (state is TodoSuccess) {
                  Navigator.pop(context);
                } else if (state is TodoError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                }
              },
              child: CustomButton(
                  onTap: () {
                    context.read<TodoCubit>().addTodo(
                          TodoModel(
                            title: titleController.text,
                            description: descriptionController.text,
                            id: DateTime.now().millisecond.toString(),
                          ),
                        );
                  },
                  title: 'Add Todo'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
