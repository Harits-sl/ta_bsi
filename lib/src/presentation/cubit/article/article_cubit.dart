import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/article_service.dart';
import 'package:ta_bsi/src/data/models/article_model.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  void fetchListArticle() async {
    try {
      emit(ArticleLoading());

      List<ArticleModel> article = await ArticleService.getArticleJson();

      emit(ArticleSuccess(article));
    } catch (e) {
      emit(ArticleFailed(e.toString()));
    }
  }
}
