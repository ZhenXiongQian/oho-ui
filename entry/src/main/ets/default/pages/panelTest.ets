@Entry
@Component
struct PanelTest {
  @State show: boolean = false
  @State position: string = 'center'

  build() {
    Column() {
      Row({space: 20}){
        Button('top').onClick(() => {
          this.position = 'top'
        })
        Button('left').onClick(() => {
          this.position = 'left'
        })
        Button('bottom').onClick(() => {
          this.position = 'bottom'
        })
        Button('right').onClick(() => {
          this.position = 'right'
        })
      }.width('100%').margin({ left: 20,top: 20, bottom: 20, right: 155 })
      Slider({
        value: 40,
      })

      Text('2021-09-30    Today Calendar: 1.afternoon......Click for details')
        .width('90%').height(50).borderRadius(10)
        .backgroundColor(0xFFFFFF).padding({ left: 20 })
        .onClick(() => {
          this.show = !this.show
        })
      Panel(this.show) { // 展示日程
        Column() {
          Row(){
            Text('Today Calendar')
            Button('X').onClick(() => {
              this.show = !this.show
            }).margin({left: 200}).backgroundColor(Color.White).fontColor(Color.Black)
          }.margin(30)
          Text('1. afternoon 4:00 The project meeting')
        }
      }
      .type(PanelType.Foldable).mode(PanelMode.Half)
      .dragBar(true) // 默认开启
      .halfHeight(700) // 默认一半
      .onChange((value: any) => {
        console.info(`width:${value.width},height:${value.height},mode:${value.mode}`)
      })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}