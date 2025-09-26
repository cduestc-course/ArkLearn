@Entry
@Component
struct Index {
  build() {
    Column(){
      //Image
      Image($r('app.media.ic_late'))
        .width(200)
        .fillColor(Color.Green)
    }
  }
}