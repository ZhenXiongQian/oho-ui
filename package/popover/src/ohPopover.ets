import router from '@system.router';
import {Position, DisplayPosition} from './popover.ets'

@Component
export struct OhPopover {
  @Link show: boolean
  @Link @Watch("setDisplayPosition") position: string
  @Link onClose: Function
  @State displayPosition: DisplayPosition  = new DisplayPosition('20%', '20%', '60%', '60%')
  private flex_center_class: object = {
    alignItems: ItemAlign.Center,
    direction: FlexDirection.Column
  }

  private aboutToAppear() {
    this.setDisplayPosition()
  }

  private aboutToDisappear() {
    this.onClose()
  }

  private setDisplayPosition() {
    console.log(`set displayPosition, position: ${this.position}`)
    switch (this.position) {
      case 'top':
        this.displayPosition.setValue('0%', '0%', '100%', '50%')
        break;
      case 'left':
        this.displayPosition.setValue('0%', '0%', '50%', '100%')
        break;
      case 'bottom':
        this.displayPosition.setValue('0%', '50%', '100%', '50%')
        break;
      case 'right':
        this.displayPosition.setValue('50%', '0%', '50%', '100%')
        break;
      default:
      //default be center
        this.displayPosition.setValue('20%', '20%', '60%', '60%')
        break;
    }
    console.log(this.displayPosition.toString())
  }

  build() {
    Flex() {
      if (this.show) {
        Stack() {
          Column() {
          }
          .zIndex(1)
          .backgroundColor(Color.Gray)
          .opacity(0.7)
          .width("100%")
          .height('100%')
          .onClick(() => {
            this.show = false
          })


          Column() {
            Text('content of popover')
              .width('100%')
              .height('100%')
              .backgroundColor(Color.Green)
              .fontSize(40)
          }
          .backgroundColor(Color.White)
          .direction(Direction.Ltr)
          .position(this.displayPosition.position)
          .width(this.displayPosition.width)
          .height(this.displayPosition.height)
          .opacity(1)
          .zIndex(2)


        }
        .position({ x: 0, y: 0 })
      }
    }
  }
}