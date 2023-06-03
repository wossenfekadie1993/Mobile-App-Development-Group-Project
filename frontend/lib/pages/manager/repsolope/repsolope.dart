import 'package:flutter/material.dart';

class ReportedPage extends StatefulWidget {
  @override
  _ReportedPageState createState() => _ReportedPageState();
}


class _ReportedPageState extends State<ReportedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reported'),
      ),
      body: Center(
        child: Text('Reported Page'),
      ),);
  }
}


class OngoingPage extends StatefulWidget {
  @override
  _OngoingPageState createState() => _OngoingPageState();
}


class _OngoingPageState extends State<OngoingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing'),
      ),
      body: Center(
        child: Text('Ongoing Page'),
      ),
    );
  }
}

class PendingPage extends StatefulWidget {
  @override
  _PendingPageState createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending'),
      ),
      body: Center(
        child: Text('Pending Page'),
      ),
    );
  }
}

class SolvedPage extends StatefulWidget {
  @override
  _SolvedPageState createState() => _SolvedPageState();
}

class _SolvedPageState extends State<SolvedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solved'),
      ),
      body: Center(
        child: Text('Solved Page'),
      ),
    );
  }
}
