@Entry
@Component
struct MotionPathExample {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State toggle: boolean = true

  build() {
    Column() {
      Button('click me')
        .motionPath({ path: 'M start.x start.y L 300 200 L 300 500 L end.x end.y', from: 0.0, to: 1.0, rotatable: true })
        .onClick((event: ClickEvent) => {
          animateTo({ duration: 4000, curve: Curve.Linear }, () => {
            this.toggle = !this.toggle;
          })
        }).backgroundColor(0x317aff)
    }.width('100%').height('100%').alignItems(this.toggle ? HorizontalAlign.Start : HorizontalAlign.Center)
  }
}