import router from '@system.router';
//import {OhPopover} from "@oho-ui/popover"
import { OhPopover } from './test.ets'

@Entry
@Component
struct f {
  build(){
    Column(){
      Text('third tier').height(60).fontSize(25)
      PopoverDem(){
      }
    }
  }
}

//@Entry
@Component
export struct PopoverDem {
  @State show: boolean = false
  @State position: string = 'center'
  @State onClose : Function = () => {
    console.log('close')

  }
  private flex_center_class: object = {
    alignItems: ItemAlign.Center,
    direction: FlexDirection.Column
  }


  build() {
    Flex(this.flex_center_class) {

      Column() {
        Button('back home').onClick(() => {
          router.back()
        }).offset({ x: 10 })
      }.width("100%").margin(15)

      Column() {
        Button('test').onClick(() => {
          this.show = true
        })
      }.margin(15)

      Row({ space: 20 }) {
        Button('top').onClick(() => {
          this.position = 'top'
          this.show = true
        })
        Button('left').onClick(() => {
          this.position = 'left'
          this.show = true
        })
        Button('bottom').onClick(() => {
          this.position = 'bottom'
          this.show = true
        })
        Button('right').onClick(() => {
          this.position = 'right'
          this.show = true
        })
      }.width('100%').margin({ left: 20, top: 20, bottom: 20 })

      Text('test').height(60).fontSize(25)
      OhPopover({
        show: $show,
        position: $position,
        onClose: $onClose
      }) {
      }
    }
  }
}