import 'dart:io';
import 'package:dio/dio.dart';

class ApiRoutes {
  String baseUrl = 'https://iran-ma-main-service.liara.run/api/v1/app';

  String homeData() => "$baseUrl/Home";

  String sendOTPCode() => "$baseUrl/auth/otp";

  String loginUser() => "$baseUrl/auth/login";

  String getUserProfile() => "$baseUrl/user";

  String logoutUser() => "$baseUrl/user/logout";

  String getChannelsList(int folder, int page) =>
      "$baseUrl/user/folder/$folder/channel?page=$page";

  String getChannelsListSimple() => "$baseUrl/user/simple-channel";

  String getChannelReceivedPosts(int channelID, int page) =>
      "$baseUrl/user/channel/$channelID/post?page=$page";

  String getChannelWatchList(int channelID) =>
      "$baseUrl/user/channel/$channelID/watch";

  String addWatchToChannel(int channelID) =>
      "$baseUrl/user/channel/$channelID/watch";

  String deleteWatchFromChannel(int channelID, int watchID) =>
      "$baseUrl/user/channel/$channelID/watch/$watchID";

  String editStatusWatchFromChannel(int channelID, int watchID) =>
      "$baseUrl/user/channel/$channelID/watch/$watchID/change_status";

  String viewPost(int postID) => "$baseUrl/user/post/$postID/view";

  String getPostImage(int postId) => "$baseUrl/user/post/$postId/image";

  String getChannelDraftsList(int channelID, int page) =>
      "$baseUrl/user/channel/$channelID/draft?page=$page";

  String addDraftToChannel(int channelID) =>
      "$baseUrl/user/channel/$channelID/draft";

  String channelDraft(int channelID, int draftID) =>
      "$baseUrl/user/channel/$channelID/draft/$draftID";

  String getSentChannelsList(int channelID, int page) =>
      "$baseUrl/user/channel/$channelID/sent?page=$page";

  String addSentToChannel(int channelID) =>
      "$baseUrl/user/channel/$channelID/sent";

  String channelSent(int channelID, int sentID) =>
      "$baseUrl/user/channel/$channelID/sent/$sentID";

  String getFolders() => "$baseUrl/user/folder";

  Future<Options> getDioHeaders() async => Options(
        followRedirects: true,
        validateStatus: (_) => true,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
}
