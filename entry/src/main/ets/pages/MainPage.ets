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
  scroller = new Scroller()

  build() {
    Column() {
      ScrollerBox({ videoList: $videoList })
        .width('100%')
    }
    .backgroundColor('#fffcfcfc')
  }

  onPageShow() {
    this.net.getVideoData(this.pageNum, this.videoList);
  }
}