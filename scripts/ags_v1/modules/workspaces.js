const hyprland = await Service.import('hyprland')
const activeId = hyprland.active.workspace.bind('id')
const workspaces = hyprland.bind('workspaces')

function workspaceButton(workspaceId = 1){
  const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${workspaceId}`)
  return Widget.Button({
//    label: activeId.as(ws => ws == workspaceId ? ""
//      : (hyprland.getWorkspace(workspaceId)?.windows || 0) == 0 ? "󰋙" 
//        : "󰫈" ),
    onClicked: () => dispatch(workspaceId),
    setup: self => self.hook(hyprland, () => {
      self.toggleClassName('ws-button-empty', 
        (hyprland.getWorkspace(workspaceId)?.windows || 0) === 0 )
      self.toggleClassName('ws-button-occupied',
        (hyprland.getWorkspace(workspaceId)?.windows || 0 ) > 0 )
      self.toggleClassName('ws-button-active', hyprland.active.workspace.id === workspaceId)
    })
    })
}

function buttonSet(monitor = 0){
  return Widget.Box({
    vertical: false,
    className: 'ws-set',
    setup: self => {
      for(let button = 1; button <= 10 * (monitor + 1); button++) {
        if(button > monitor * 10){
          self.add (workspaceButton(button));
        }
      }
    },
  })
}


export function workspaceBox(monitor = 0){ 
 return Widget.Box({
        vertical: false,
        className: 'ws-box',
        child: buttonSet(monitor),
  })
}

