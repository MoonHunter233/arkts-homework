import ScrollerBox from '../components/ScrollerBox';
import { VideoInfo } from '../model/VideoInfo';
import { NetUtil } from '../utils/NetUtil';

@Entry
@Component
struct SearchPage {
  @State keyword: string = '';
  @State pageNum: number = 1;
  @State videoList: Array<VideoInfo> = [];
  net: NetUtil = new NetUtil();
  search = () => {
    this.videoList = []
    this.net.searchVideoData(this.keyword, this.pageNum, this.videoList);
  }


  build() {
    Column() {
      Row() {
        TextInput()
          .onChange((value: string) => {
            this.keyword = value;
          })
          .width('300px')
        Button('?')
          .onClick(() => {
            this.search();
          })
          .height('100%')
          .width('10%')
          .backgroundColor(Color.Red)
      }
      .height('100px')
      .width('100%')
      .border({ color: Color.Black, style: BorderStyle.Solid, width: { bottom: '1px' } })

      ScrollerBox({ videoList: $videoList })
        .width('100%')
    }
    .backgroundColor('#fffcfcfc')
  }

  onPageShow() {
    this.search();
  }
}