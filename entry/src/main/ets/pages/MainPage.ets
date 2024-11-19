import MainBar from '../components/MainBar';
import ScrollerBox from '../components/ScrollerBox';
import VideoBox from '../components/VideoBox';
import { VideoInfo } from '../model/VideoInfo';
import { NetUtil } from '../utils/NetUtil';

@Entry
@Component
struct MainPage {
  @State pageNum: number = 0;
  @State videoList: Array<VideoInfo> = [];
  net: NetUtil = new NetUtil();
  getVideo = () => {
    this.net.getVideoData(this.pageNum, this.videoList);
    this.pageNum += 1;
  }

  build() {
    Column() {
      MainBar()
        .width('100%')
      ScrollerBox({ videoList: $videoList, function: this.getVideo })
        .width('100%')
    }
    .backgroundColor('#fffcfcfc')
  }

  onPageShow() {
    this.getVideo();
  }
}