import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/youtube_service.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';

part 'youtube_state.dart';

class YoutubeCubit extends Cubit<YoutubeState> {
  YoutubeCubit() : super(YoutubeInitial());

  /// variabel list youtube
  List<YoutubeModel> youtube = [];

  /// fungsi setYoutube untuk mengisi variabel youtube
  void setYoutube(List<YoutubeModel> newYoutube) {
    youtube = newYoutube;
  }

  void fetchListYoutube() async {
    try {
      emit(YoutubeLoading());

      /// jika [youtube] masih kosong paggil fungsi setYoutube dengan
      /// paramater YoutubeService.fetchYoutube()
      if (youtube.isEmpty) {
        setYoutube(await YoutubeService.fetchYoutube());
      }

      emit(YoutubeSuccess(youtube));
    } catch (e) {
      emit(YoutubeFailed(e.toString()));
    }
  }
}
