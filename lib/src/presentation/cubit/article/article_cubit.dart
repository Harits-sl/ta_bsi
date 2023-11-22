import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/article_service.dart';
import 'package:ta_bsi/src/data/models/article_model.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  /// variabel list article
  List<ArticleModel> article = [];

  /// fungsi setArticle untuk mengisi variabel article
  void setArticle(List<ArticleModel> newArticle) {
    article = newArticle;
  }

  void fetchListArticle() async {
    try {
      emit(ArticleLoading());

      /// jika [article] masih kosong paggil fungsi setArticle dengan
      /// paramater ArticleService.fetchArticle()
      if (article.isEmpty) {
        setArticle(await ArticleService.fetchArticle());
      }

      emit(ArticleSuccess(article));
    } catch (e) {
      emit(ArticleFailed(e.toString()));
    }
  }
}
