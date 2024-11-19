import display from '@ohos.display';
import router from '@ohos.router';
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
            .onClick(() => {
              router.pushUrl({
                url: 'pages/WebPage',
                params: {
                  url: item.shortLink
                }
              })
            })
        })
      }
    }
    .width('100%')
    //TODO distance to judge
    .onScrollEdge((edge: Edge) => {
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