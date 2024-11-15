import VideoBox from '../components/VideoBox';
import { VideoInfo } from '../model/VideoInfo';
import { NetUtil } from '../utils/NetUtil';

@Entry
@Component
struct MainPage {
  @State pageNum: number = 0;
  @State videoList: Array<VideoInfo> = [];
  scroller = new Scroller()

  build() {
    Column() {
      //TODO make scroller as a component
      Scroll(this.scroller) {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceAround }) {
          ForEach(this.videoList, (item, index) => {
            VideoBox({
              coverURL: item.coverURL,
              title: item.title,
              publishTime: item.publishTime,
              duration: item.duration,
              shortLink: item.shortLink,
            })
          })
        }
      }
      .width('100%')
    }
    .backgroundColor('#fffcfcfc')
  }

  onPageShow() {
    let net = new NetUtil();
    net.getVideoData(this.pageNum, this.videoList);
  }
}