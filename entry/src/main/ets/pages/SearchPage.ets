import ScrollerBox from '../components/ScrollerBox';
import SearchBar from '../components/SearchBar';
import { VideoInfo } from '../model/VideoInfo';
import { NetUtil } from '../utils/NetUtil';

@Entry
@Component
struct SearchPage {
  @State keyword: string = '';
  @State pageNum: number = 0;
  @State videoList: Array<VideoInfo> = [];
  net: NetUtil = new NetUtil();
  search = () => {
    if (this.keyword == '') {
      return;
    }
    this.net.searchVideoData(this.keyword, this.pageNum, this.videoList);
    this.pageNum += 1;
  }
  re_search = () => {
    this.videoList = [];
    this.search()
  }

  build() {
    Column() {
      SearchBar({ keyword: $keyword, re_search: this.re_search })
        .width('100%')
        .border({ color: Color.Black, style: BorderStyle.Solid, width: { bottom: '1px' } })

      ScrollerBox({ videoList: $videoList, function: this.search })
        .width('100%')
    }
    .backgroundColor('#fffcfcfc')
  }

  onPageShow() {
    this.videoList = [];
  }
}