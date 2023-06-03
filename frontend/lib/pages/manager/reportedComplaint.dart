
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';
import '../../application/Auth/Bloc/Auth_state.dart';
import '../../application/Auth/Bloc/Auth_bloc.dart';
import '../../application/Auth/auth.dart';
import '../../application/manager/bloc/manager_bloc.dart';
import '../../models/complaint_model/complaint_report.dart';


class managerScreen extends StatefulWidget {
  managerScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<managerScreen> createState() => _ReportcomplaintState();
}

class _ReportcomplaintState extends State<managerScreen> {
  late IO.Socket socket;
  List<Report> reported = [];
  dynamic message;
  dynamic user;

  @override
  void initState() {
    super.initState();
    connect();
  }

  dynamic connect() async {
    try {
      socket = IO.io('http://localhost:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      socket.emit("login", user.userId);
      socket.onConnect((data) {
        socket.on("report", (msg) async {
          message = msg;
          final managerBloc = BlocProvider.of<managerblocBloc>(context);
          managerBloc.add(
            GetReported(msg),
          );
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
          children: [
            SafeArea(
              child: Container(
                child: Stack(clipBehavior: Clip.none, children: [
                  const Card(
                    child: ListTile(
                     
                      title: Text(
                        'Reported',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Reported complaints',
              style: TextStyle(
                  fontFamily: 'times',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<managerblocBloc, managerblocState>(
                builder: (_, managerblocState managerState) {
              bool selected1 = true;
              bool selected2 = false;
              bool selected3 = false;
              if (managerState is GetSolvedSucessful) {
                selected1 = false;
                selected2 = false;
                selected3 = true;
              }
              if (managerState is GetOngoingSucessful) {
                selected1 = false;
                selected2 = true;
                selected3 = false;
              }
              if (managerState is GetReportedSucessful) {
                selected1 = true;
                selected2 = false;
                selected3 = false;
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 4.0,
                              color: selected1 ? Colors.orange : Colors.black),
                        ),
                      ),
                      width: 100,
                      height: 40,
                      child: const Text(
                        'Reported',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () {
                      final managerBloc =
                          BlocProvider.of<managerblocBloc>(context);
                      managerBloc.add(
                        GetReported(message),
                      );
                    },
                  ),
                  InkWell(
                    hoverColor: Colors.orange,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 4.0,
                              color: selected2 ? Colors.orange : Colors.black),
                        ),
                      ),
                      width: 100,
                      height: 40,
                      child: const Text(
                        'OnGoing',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () async {
                      final managerBloc =
                          BlocProvider.of<managerblocBloc>(context);
                      managerBloc.add(
                        GetOngoing(user.fullname),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 4.0,
                              color: selected3 ? Colors.orange : Colors.black),
                        ),
                      ),
                      width: 100,
                      height: 40,
                      child: const Text(
                        'Solved',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () async {
                      final managerBloc =
                          BlocProvider.of<managerblocBloc>(context);
                      managerBloc.add(
                        GetSolved(user.fullname),
                      );
                    },
                  ),
                ],
              );
            }),
            BlocBuilder<managerblocBloc, managerblocState>(
                builder: (_, managerblocState managerState) {
              if (managerState is managerblocInitial) {
                return BlocBuilder<AuthBloc, AuthState>(
                    builder: (_, AuthState state) {
                  if (state is LoginSuccessful) {
                    user = state.response;
                    return Container(
                        padding: const EdgeInsets.all(70),
                        child: Column(children: const [
                          Text(
                            'no new reported data ',
                            style: TextStyle(
                                fontFamily: "italic",
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text('tap ongoing for previously recived',
                              style: TextStyle(
                                  fontFamily: "italic",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))
                        ]));
                  }
                  return const Text('');
                });
              } else if (managerState is GetReportedSucessful) {
                reported.insert(0, managerState.ComplaintList);
                return Expanded(
                  child: ListView.builder(
                      itemCount: (reported).length,
                      itemBuilder: (BuildContext context, int index) {
                        return Complaints(
                          title: (reported)[index].title,
                          
                          
                        );
                      }),
                );
              } else if (managerState is GetOngoingSucessful) {
                return Ongoingcomplaint(
                    ongoing: json.decode(managerState.ComplaintList.body));
              } else if (managerState is GetSolvedSucessful) {
                return Solvedcomplaint(
                    solved: json.decode(managerState.ComplaintList.body));
              } else {
                return const Text('');
              }
            })
          ],
        )),
       );
  }
}