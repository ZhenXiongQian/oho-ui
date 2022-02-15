import router from '@system.router';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Row({ space: 30 }) {
        Button('progressDem').onClick(() => {
          router.push({
            uri: 'pages/progressDem'
          })
        })
        Button('swiperLayout').onClick(() => {
          router.push({
            uri: 'pages/swiperLayoutDem'
          })
        })
      }.margin(15)

      Button('cascaderDem').onClick(() => {
        router.push({
          uri: 'pages/cascaderDem'
        })
      }).margin(15)

      Button('test').onClick(() => {
        router.push({
          uri: 'pages/test'
        })
      }).margin(15)

      Button('popoverDem').onClick(() => {
        router.push({
          uri: 'pages/popoverDem'
        })
      }).margin(15)
    }
    .width('100%')
    .height('100%')
  }
}