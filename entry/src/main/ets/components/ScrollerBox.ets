import display from '@ohos.display';
import { VideoInfo } from '../model/VideoInfo';
import VideoBox from './VideoBox';

@Component
export default struct ScrollerBox {
  @Link videoList: Array<VideoInfo>;
  function: Function;
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
    .onScrollEdge((edge : Edge) => {
      if (edge.valueOf() == 2) {
        this.function()
      }
    })
    // .onScroll((x, y) => {
    //   console.log('scroll test ' + y + '...' + display.getDefaultDisplaySync().height)
    //
    //   if (y < 0) {
    //     this.function()
    //   }
    // })
  }
}