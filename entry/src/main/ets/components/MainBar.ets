import router from '@ohos.router';

@Preview
@Component
export default struct MainBar {
  build() {
    Row() {
      Image($r('app.media.img'))
        .width('150px')
        .height('150px')
        .border({ radius: '20px' })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/SponsorPage'
          })
        })
      Text('首页')
      .fontSize('80px')
      Row () {
        Text('🔍')
          .fontSize('80px')
          .lineHeight('150px')
      }
      .width('150px')
      .height('150px')
      .onClick(() => {
        router.pushUrl({
          url: 'pages/SearchPage'
        })
        console.log('tt test');
      })
    }
    .padding({left : '20px', right : '20px'})
    .width('100%')
    .height('200px')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .border({width : {bottom : '1px'}, color : Color.Black, style : BorderStyle.Solid})
    .shadow({ radius: 5, color: Color.Gray, offsetX: 5, offsetY: 5 })
    .margin({bottom : '5px'})
  }
}