import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_manager.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ManagerBloc(),
        child: AdminPage(),
      ),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Managers'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: () {},
                  child: Text('Managers'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: () {},
                  child: Text('Users'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    color: Colors.grey[300],
                    width: 10.0,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      'Full Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        SizedBox(width: 5.0),
                        Text(
                          'Update',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Delete',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: BlocBuilder<ManagerBloc, List<String>>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final managerName = state[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            Text(
                              '${index + 1}.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              managerName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.update,
                                  color: Colors.yellow,
                                ),
                                onPressed: () {
                                  final managerBloc = BlocProvider.of<ManagerBloc>(context);
                                  managerBloc.add(UpdateManagerEvent(index, 'New Manager Name'));
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  final managerBloc = BlocProvider.of<ManagerBloc>(context);
                                  managerBloc.add(DeleteManagerEvent(index));
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewManagerPage()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Add New Manager',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ManagerBloc extends Bloc<ManagerEvent, List<String>> {
  ManagerBloc() : super([]);

  @override
  Stream<List<String>> mapEventToState(ManagerEvent event) async* {
    if (event is AddManagerEvent) {
      state.add(event.managerName);
    } else if (event is UpdateManagerEvent) {
      state[event.index] = event.newManagerName;
    } else if (event is DeleteManagerEvent) {
      state.removeAt(event.index);
    }
    yield List.from(state);
  }
}

abstract class ManagerEvent {}

class AddManagerEvent extends ManagerEvent {
  final String managerName;

  AddManagerEvent(this.managerName);
}

class UpdateManagerEvent extends ManagerEvent {
  final int index;
  final String newManagerName;

  UpdateManagerEvent(this.index, this.newManagerName);
}

class DeleteManagerEvent extends ManagerEvent {
  final int index;

  DeleteManagerEvent(this.index);
}

// class NewManagerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add New Manager'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             final managerBloc = BlocProvider.of<ManagerBloc>(context);
//             managerBloc.add(AddManagerEvent('New Manager'));
//             Navigator.pop(context);
//           },
//           child: Text('Add Manager'),
//         ),
//       ),
//     );
//   }
// }
