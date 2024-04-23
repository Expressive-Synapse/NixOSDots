const changeBrightness = (monitorId, value) => {
  Utils.execAsync(`ddcutil -d ${monitorId} setvcp 10 ${value * 100}`)
}
