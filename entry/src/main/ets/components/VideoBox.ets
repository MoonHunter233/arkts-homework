import { VideoInfo } from '../model/VideoInfo';

@Entry
@Component
export default struct VideoBox {
  // @Link video : VideoInfo;
  videoInfoTest: VideoInfo = {
    avid: 280871915,
    coverURL: 'http://i0.hdslb.com/bfs/archive/578c720556c7aa0f89cb72af06594cd97459c572.jpg',
    title: '【填词】音Distance -“英国的字我 认不得几个”',
    publishTime: '2001-11-4',
    duration: 699,
    shortLink: 'https://b23.tv/BV1Bc411X7fg'
  }
  trans = (duration: number) => {
    let m = ~~(duration / 60);
    let s = ~~((duration % 60));
    return `${m}:${s < 10 ? `0${s}` : `${s}`}`
  }

  build() {
    Column() {
      Image(this.videoInfoTest.coverURL)
        .height('65%')
        .width('100%')
      Row() {
        Text(this.videoInfoTest.title)
          .fontSize('45px')
          .lineHeight('50px')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding({ top: '20px', left: '20px', right: '30px'})
      .height('120px')

      Row() {
        Text(this.videoInfoTest.publishTime)
          .fontColor(Color.Gray)
          .fontSize('30px')
        //TODO transform duration to time-format
        Text(this.trans(this.videoInfoTest.duration))
          .fontSize('30px')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding('20px')
    }
    .height('520px')
    .width('520px')
    .border({ width: '1px' })
    .borderRadius('10px')
    .margin('10px')
    .alignItems(HorizontalAlign.Start)
  }
}