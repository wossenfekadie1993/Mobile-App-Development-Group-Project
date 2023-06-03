import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:students_voice/application/manager/bloc/manager_bloc.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState> {
  AnnouncementsBloc() : super(AnnouncementsInitial());

  @override
  Stream<AnnouncementsState> mapEventToState(
    AnnouncementsEvent event,
  ) async* {
    if (event is LoadAnnouncements) {
      yield AnnouncementsLoading();
      try {
        // Simulating an API call to fetch announcements
        await Future.delayed(Duration(seconds: 2));
        final announcements = [
          Announcement(
            title: 'Final Exam Schedule',
            description: 'This is the final exam',
          ),
          Announcement(
            title: 'Important Notice',
            description: 'Please read carefully',
          ),
          Announcement(
            title: 'Upcoming Event',
            description: 'Join us for a fun-filled day',
          ),
        ];
        yield AnnouncementsLoaded(announcements: announcements);
      } catch (e) {
        yield AnnouncementsError(message: 'Failed to load announcements');
      }
    }
  }
}

class Announcement {
  final String title;
  final String description;

  Announcement({required this.title, required this.description});
}
