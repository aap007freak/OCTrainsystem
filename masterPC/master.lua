--read the readme provided with this project to get more info about this file
--and how it should be installed

local component = require("component")
modem = component.modem



function openPorts()
  modem.open(2)
end

function call()
_,ourmodem,sendermodem,port,_,id,code,content = event.pull("modem") --wait for a message and save it in these variables
end

while true do
  call()
  os.sleep(1) -- adding latency to remove some lag (can be edited if wanted)
end
