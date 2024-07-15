@Component
struct HeadComponent {
  @Prop title: string;

  build() {
    Row({ space: 10, alignItems: Align.Center }) {
      // 如果需要返回按钮，可以在这里添加
      // Image($r('app.media.backIcon')).width(24).height(24).onClick(() => { /* 返回逻辑 */ });

      Text(this.title)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333')
        .flexGrow(1)
        .textAlign(TextAlign.Center);

      // 如果有其他按钮，可以在这里添加
      // Image($r('app.media.settingsIcon')).width(24).height(24).onClick(() => { /* 设置逻辑 */ });
    }
    .width('100%')
    .height(56)
    .backgroundColor('#fff')
    .padding({ left: 16, right: 16 })
    .borderBottom('1px solid #eee');
  }
}
