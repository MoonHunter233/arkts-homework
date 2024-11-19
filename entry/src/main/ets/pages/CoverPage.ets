import router from '@ohos.router';

@Entry
@Component
struct CoverPage {
  @State time: number = 5
  interval: number
  goHome = () => {
    clearInterval(this.interval)
    //can use pushUrl, but be supposed to use replaceUrl
    router.replaceUrl({
      url: 'pages/MainPage'
    })
  }
  timer: () => void = () => {
    this.time = 5
    this.interval = setInterval(() => {
      this.time--
      console.log(this.time.toString())
      if (this.time === 0) {
        this.goHome()
      }
    }, 1000)
  }

  build() {
    Column() {
      Row() {
        Text('skip').fontColor('white').fontSize('50px').onClick(() => {
          this.goHome()
        })
        Column().width('4px').height('100%').backgroundColor('white').margin({ left: 7, right: 7 })
        Text(this.time.toString()).fontColor('white').fontSize('50px')
      }
      .width('20%')
      .height('100px')
      .borderRadius('75px')
      .backgroundColor('rgba(0, 0, 0, 0.5)')
      .position({ x: '76%', y: '20px' })
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.cover'))
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImagePosition(Alignment.Center)
  }

  onPageShow() {
    this.timer()
  }
}