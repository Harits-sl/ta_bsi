import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/youtube_service.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';

part 'youtube_state.dart';

class YoutubeCubit extends Cubit<YoutubeState> {
  YoutubeCubit() : super(YoutubeInitial());

  void fetchListYoutube() async {
    try {
      emit(YoutubeLoading());

      List<YoutubeModel> youtube = await YoutubeService.getYoutubeJson();

      emit(YoutubeSuccess(youtube));
    } catch (e) {
      emit(YoutubeFailed(e.toString()));
    }
  }
}
