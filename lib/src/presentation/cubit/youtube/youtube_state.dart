part of 'youtube_cubit.dart';

abstract class YoutubeState extends Equatable {
  const YoutubeState();

  @override
  List<Object> get props => [];
}

class YoutubeInitial extends YoutubeState {}

class YoutubeLoading extends YoutubeState {}

class YoutubeSuccess extends YoutubeState {
  final List<YoutubeModel> youtube;

  const YoutubeSuccess(this.youtube);

  @override
  List<Object> get props => [youtube];
}

class YoutubeFailed extends YoutubeState {
  final String error;

  const YoutubeFailed(this.error);

  @override
  List<Object> get props => [error];
}
