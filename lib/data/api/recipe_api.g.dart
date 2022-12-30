// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RecipeApi implements RecipeApi {
  _RecipeApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.spoonacular.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Recipe> getRecipeById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Recipe>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'recipes/${id}/information',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Recipe.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RecipeSearchResponse> searchRecipes({
    required query,
    number = _defaultPage,
    offset = 0,
    cuisine,
    diet,
    intelorances,
    type,
    includeIngredients,
    maxReadyTime,
    sort,
    sortDirection,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'query': query,
      r'number': number,
      r'offset': offset,
      r'cuisine': cuisine,
      r'diet': diet,
      r'intelorances': intelorances,
      r'type': type,
      r'includeIngredients': includeIngredients,
      r'maxReadyTime': maxReadyTime,
      r'sort': sort,
      r'sortDirection': sortDirection,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RecipeSearchResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'recipes/complexSearch',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RecipeSearchResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RandomRecipesResponse> getRandomRecipes({
    number = _recipesPageSize,
    tags,
    offset = 0,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'number': number,
      r'tags': tags,
      r'offset': offset,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RandomRecipesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'recipes/random',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RandomRecipesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<RecipeSearchItem>> autoCompleteSearch({
    required query,
    number = _autoCompleteSize,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'query': query,
      r'number': number,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<RecipeSearchItem>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'recipes/autocomplete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => RecipeSearchItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
