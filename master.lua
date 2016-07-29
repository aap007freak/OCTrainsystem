--read the readme provided with this project to get more info

local component = require("component")
modem = component.modem



function openPorts()
  modem.open(2)
end

function call()
end

while true do
  call
  os.sleep(1) -- adding latency to remove some lag (can be edited if wanted)
