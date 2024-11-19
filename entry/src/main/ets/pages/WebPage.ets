import router from '@ohos.router'
import webview from '@ohos.web.webview'
@Entry
@Component
struct WebPage {
  @State value:string = router.getParams()['url']
  controller:webview.WebviewController = new webview.WebviewController

  build() {
    Column() {
      Web({src:this.value,controller:this.controller})
    }
    .width('100%')
    .height('100%')
  }
}