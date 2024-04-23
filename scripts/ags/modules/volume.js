const audio = await Service.import('audio')
export const volume = audio.speaker.bind('volume')
let hovered = Variable(false)
const levels = {
  mute:0,
  low:0.01,
  medium:0.34,
  high:0.67,
};
const volumeIcon = () => Widget.Label({
  className: 'vol-icon',
  label: volume.transform(vol => vol >= levels.high ? "󰕾" 
    : vol >= levels.medium ? "󰖀" 
      : vol >= levels.low ? "󰕿" 
        : vol == levels.mute ? "󰝟" 
          : "")
})

const volumeRevealer = () => Widget.Revealer({
  revealChild: hovered.bind(),
  transitionDuration: 650,
  transition: 'slide_left',
  child: Widget.Label({
    className: 'vol-percent',
    label: volume.transform(x => `${Math.round(x * 100)}%`),
  }),
  setup: self => self.on("leave-notify-event", () => {
    hovered.value = false
  }).on("enter-notify-event", () => {
    hovered.value = true
  })
})

const volumeCtlLayout = () => Widget.Box({
  className: 'vol-box',
  vertical: false,
  children: [volumeRevealer(), volumeIcon()]
})

export const volumeCtl = () => Widget.EventBox({
  className: 'vol-ebox', 
  onScrollUp: () => audio.speaker.volume = audio.speaker.volume + 0.01,
  onScrollDown: () => audio.speaker.volume = audio.speaker.volume - 0.01,
  onPrimaryClick: () => audio.speaker.isMuted == true ? audio.speaker.isMuted = false 
    : audio.speaker.isMuted = true,
  setup: self => self.on("leave-notify-event", () => {
    hovered.value = false
  }).on("enter-notify-event", () => {
    hovered.value = true
  }),
  child: volumeCtlLayout(),})
