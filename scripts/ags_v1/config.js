import { workspaceBox } from './modules/workspaces.js';
import { volumeCtl } from './modules/volume.js';
import { clock } from './modules/clock.js';
import { drawingarea } from './modules/Visualizer/cava.js'

const rightBarLayout = () => Widget.Box({
  children: [volumeCtl(),clock()],
})

const RightBar = (monitor = 0) => Widget.Window({
  monitor,
  name: `RightBar${monitor}`,
  anchor: ['top', 'right'],
  className: 'right-bar',
  child: rightBarLayout(),});

const WorkspaceBar = (monitor = 0) => Widget.Window({
  monitor,
  name: `WorkspaceBar${monitor}`,
  anchor: [`top`],
  className: 'ws-bar',
  child: workspaceBox(monitor) 
});


App.config({
    style: './style.css',
    windows: [
        RightBar(0),
        RightBar(1),
        WorkspaceBar(0),
        WorkspaceBar(1),
    ],
});
