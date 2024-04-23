import Variable from "resource:///com/github/Aylur/ags/variable.js";
const cavaSettings = {
  framerate : 60,
  bars : 20,
  barHeight : 100,
  align : "end",
  vertical : false,
  smooth : false,
}

export const Cava = (settings = cavaSettings) => Variable([],{
    listen: [
      [
        "bash",
        "-c",
        `printf "\
          [general]\n
          framerate = ${settings.framerate}\n
          bars = ${settings.bars}\n
          [output]\n
          method = raw\n
          raw_target = /dev/stdout\n
          data_format = ascii\n
          ascii_max_range = ${settings.barHeight}
        "|cava -p /dev/stdin`
      ],
      out => out.split(";").slice(0,-1)
    ]
})

//Cava().connect('notify::value', cava => print(cava.value))

export const drawingarea = () => Widget.DrawingArea({
  widthRequest: 50,
  heightRequest: 50, 
}).on('draw',(widget, cr) => {
  cr.setLineWidth(0.5)
  cr.setSourceRGB(0,0,100)
  cr.rectangle(0.25,0.25,0.5,0.5)
  cr.stroke(cr)
})

