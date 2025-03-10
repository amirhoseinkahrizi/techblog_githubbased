import 'dart:developer';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/constante/api_constant.dart';
import 'package:techblog_githubbased/models/podcast_file_model.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';

class SinglePodcastContoroller extends GetxController {
  final player = AudioPlayer();
  late var playlist;
  var id;
  RxBool playstatus = false.obs;
  RxInt selectedIndex = 0.obs;
  SinglePodcastContoroller({this.id});
  RxList<PodcastFileModel> podcastfilelist = RxList();
  RxBool loading = false.obs;

  @override
  onInit() async {
    super.onInit();
    playlist = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    await getpodcastfile();
    await player.setAudioSource(playlist,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  getpodcastfile() async {
    loading.value = true;
    var response =
        await DioServices().getMethod(ApiUrlConstant.getpodcastfile + id);
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastfilelist.add(PodcastFileModel.fromJson(element));
        playlist.add(AudioSource.uri(
            Uri.parse(PodcastFileModel.fromJson(element).file!)));

        loading.value = false;
        log(response.data.toString());
      }
    }
  }
}
