const notifications = await Service.import("notifications")

function GetIcon ({ app_entry, app_icon, image }) {
  if (image) {
    return Widget.Box({
      css: `background-image: url('${image}');`
         + 'background-size: contain;'
         + 'background-repeat: no-repeat;'
         + 'background-position: center;',
    })
  }

  let icon = "dialog-information-symbolic"
  if (Utils.lookUpIcon(app_icon))
    icon = app_icon 

  if (app_entry && Utils.lookUpIcon(app_entry))
    icon = app_entry

  return Widget.Box({
    child: Widget.Icon(icon),
    })
}

const NotiIcon = (notiObject) => Widget.Box({
  vpack: "start",
  class_name: "icon",
  css: 'min-width: 68px;'
     + 'min-height: 68px;'
     + 'margin-right: 1em;',
  child: GetIcon(notiObject),
})

const NotiTitle = (notiObject) => Widget.Label({
  class_name: "title",
  xalign: 0,
  justification: "left",
  hexpand: true,
  max_width_chars: 24,
  truncate: "end",
  wrap: true,
  label: notiObject.summary, 
  use_markup: true,
})

const NotiBody = (notiObject) => Widget.Label({
  class_name: "body",
  hexpand: true,
  use_markup: true,
  xalign: 0,
  justification: 'left',
  label: notiObject.body,
  wrap: true,
})

const NotiActions = (notiObject) => Widget.Box({
  class_name: 'actions',
  children: notiObject.actions.map(({ id, label }) => Widget.Button({
    class_name: "action-button",
    on_clicked: () => {
      notiObject.invoke(id)
      notiObject.dismiss()
    },
    hexpand: true,
    child: Widget.Label(label),
  }))
})

const NotiTextBox = (notiObject) => Widget.Box({
  vertical: true,
  children: [NotiTitle(notiObject), NotiBody(notiObject)],
})

const NotiIconBox = (notiObject) => Widget.Box({
  children: [NotiIcon(notiObject), NotiTextBox(notiObject)],
})

const NotiPopup = (notiObject) => Widget.Box({
  class_name: `notification-${notiObject.urgency}`,
  vertical: true,
  children: [NotiIconBox(notiObject), NotiActions(notiObject)],
})

const NotiPopupList = Widget.Box ({
  vertical: true,
  children: notifications.popups.map(NotiPopup),
})

function onNotified(_, /** @type {number} */ id){
  const n = notifications.getNotification(id)
  if (n)
    NotiPopupList.children = [NotiPopup(n), ...NotiPopupList.children]
}

function onDismissed(_, /** @type {number} */ id){
  NotiPopupList.children.find(n => n.attribute.id === id)?.destroy()
}

const PopupWindow = (monitor = 0) => Widget.Window({
  monitor,
  name: `notifications${monitor}`,
  class_name: 'notification-popups',
  anchor: ['top', 'right'],
  child: Widget.Box({
    css: 'min-width: 2px; min-height: 2px;',
    class_name: 'notifications',
    vertical: true,
    child: NotiPopupList,
  })
})

export function NotificationPopups(monitor = 0) {

  NotiPopupList.hook(notifications, onNotified, "notified")
               .hook(notifications, onDismissed, "dismissed")

  return PopupWindow(monitor)
}
