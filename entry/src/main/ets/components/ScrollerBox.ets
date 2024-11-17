import { VideoInfo } from '../model/VideoInfo';
import VideoBox from './VideoBox';

@Component
export default struct ScrollerBox {
  @Link videoList: Array<VideoInfo>;
  scroller = new Scroller()

  build() {
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
}