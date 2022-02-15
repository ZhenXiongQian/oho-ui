import router from '@system.router';

interface option {
  name: string,
  code: string,
  items: option[] | null | undefined
}

@Component
struct childTest {
  @Link options: option[]
  build() {
    Column() {
      Text(this.options[0].code).fontSize(35).fontColor(Color.Red)
      Text(this.options[1].code).fontSize(35).fontColor(Color.Red)
    }
  }
}

@Entry
@Component
export struct CascaderDem {
  @State options: option[] = [
    {
      name: '浙江省',
      code: '330000',
      items: [{ name: '杭州市', code: '330100', items: null }],
    },
    {
      name: '江苏省',
      code: '320000',
      items: [{ name: '南京市', code: '320100', items: null }],
    },
  ];

  @State test : string = 'fffffff'

  @State show: boolean = false

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Button('back home').onClick(() => {
          router.back()
        })
      }.width('90%').border({width : '90%',color: Color.Gray, style: BorderStyle.Solid}).margin({top: 10}).backgroundColor(Color.Green)

      childTest({options: $options})

      Text(this.options[0].name).width('100%').height(100).fontSize(20)


      Tabs() {
        TabContent() {
          //          Text('fuck')
          ForEach(this.options, (item) => {
            Text(item.name + 'fuck')
              .width('100%')
          }, item => item)

          //          List() {
          //            ForEach(this.options, (item) => {
          //              ListItem() {
          //                Text(item.name)
          //                  .width('100%')
          //              }
          //            }, item => item)
          //          }
        }.tabBar('省份')
      }
    }
  }
}