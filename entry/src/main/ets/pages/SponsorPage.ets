@Entry
@Component
struct SponsorPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Column() {
          Row() {
            Text('打赏 Buy me a cup of Java')
              .fontSize('50px')
              .fontWeight(600)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ bottom: '45px' })

          Row() {
            Text('如果觉得该项目帮助到了您，请作者喝杯咖啡吧☕️。')
              .fontSize('30px')
              .fontColor(Color.Gray)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }
        .width('780px')

        Image($r('app.media.java'))
          .width('200px')
          .height('180px')
      }
      .width('100%')
      .margin({ bottom: '180px' })
      .padding({ top: '100px' })

      Row() {
        Text('# Wechat')
          .fontSize('30px')
      }
      .width('100%')
      .border({ color: '#ffe2e2e2', style: BorderStyle.Solid, width: { bottom: '1px' } })

      Image('')
        .width('700px')
        .height('700px')

      Row() {
        Text('# AliPay')
          .fontSize('30px')
      }
      .width('100%')
      .border({ color: '#ffe2e2e2', style: BorderStyle.Solid, width: { bottom: '1px' } })

      Image('')
        .width('700px')
        .height('700px')
    }
    .padding('40px')
  }
}