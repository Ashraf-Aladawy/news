import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/news_data_model.dart';
import 'package:news/models/source_response_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  SourceResponseModel? sourceResponse;
  NewsDataModel? newsModel;
  int selectedSource = 0;
  String? selectedCategory;
  bool isObscure = false;
  bool rePassObscure = false;
  List<String> categories = [
    "General",
    "Business",
    "Sports",
    "Technology",
    "Entertainment",
    "Health",
    "Science",
  ];

  HomeCubit() : super(HomeInitState());

  void getSources(String? category) async {
    try {
      emit(GetSourcesLoadingState());
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": "7d3a22aa41694ffaa5538b61529cf70a", "category": category});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        sourceResponse = SourceResponseModel.fromJson(json);
        getNewsData();
        emit(GetSourcesSuccessState());
      } else {
        emit(GetSourcesErrorState());
      }
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }

  void getNewsData() async {
    try {
      emit(GetNewsDataLoadingState());
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        "apiKey": "7d3a22aa41694ffaa5538b61529cf70a",
        "sources": sourceResponse?.sources?[selectedSource].id ?? ""
      });
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        newsModel = NewsDataModel.fromJson(json);
        emit(GetNewsDataSuccessState());
      } else {
        emit(GetSourcesErrorState());
      }
    } catch (e) {
      print(e);
      emit(GetNewsDataErrorState());
    }
  }

  void searchAboutNewsData(String query) async {
    try {
      emit(GetSearchDataLoadingState());
      Uri url = Uri.https("newsapi.org", "/v2/everything",
          {"apiKey": "7d3a22aa41694ffaa5538b61529cf70a", "q": query});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        newsModel = NewsDataModel.fromJson(json);
        emit(GetSearchDataSuccessState());
      } else {
        emit(GetSearchDataErrorState());
      }
    } catch (e) {
      print(e);
      emit(GetSearchDataErrorState());
    }
  }

  void changeSource(int index) {
    selectedSource = index;
    getNewsData();
    emit(ChangeSelectedSourceState());
  }

  void onCategoryClicked(String category) {
    selectedCategory = category;
    emit(OnCategoryClickedState());
  }

  void onGoHomeClicked(BuildContext context) {
    Navigator.pop(context);
    selectedCategory = null;
    emit(OnGoHomeClickedState());
  }

  void changePassVisibility() {
    isObscure = !isObscure;
    emit(ChangePassVisibilityState());
  }

  void changeRePassVisibility() {
    rePassObscure = !rePassObscure;
    emit(ChangeRePassVisibilityState());
  }
}
