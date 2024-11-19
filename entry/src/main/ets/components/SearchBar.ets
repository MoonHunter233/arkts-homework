import router from '@ohos.router';

@Preview
@Component
export default struct SearchBar {
  @Link keyword: string;
  re_search: Function;

  build() {
    Row() {
      Image($r('app.media.img'))
        .width('150px')
        .height('150px')
      TextInput()
        .fontSize('80px')
        .width('600px')
        .onChange(value => {
          this.keyword = value;
        })
      Row() {
        Text('🔍')
          .fontSize('80px')
          .lineHeight('150px')
      }
      .width('150px')
      .height('150px')
      .onClick(() => {
        this.re_search();
      })
    }
    .padding({ left: '20px', right: '20px' })
    .width('100%')
    .height('200px')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .border({ width: { bottom: '1px' }, color: Color.Black, style: BorderStyle.Solid })
    .shadow({ radius: 5, color: Color.Gray, offsetX: 5, offsetY: 5 })
    .margin({ bottom: '5px' })
  }
}