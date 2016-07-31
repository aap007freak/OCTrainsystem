--read the readme provided with this project to get more info about this file
--and how it should be installed

local component = require("component")
modem = component.modem

stations = {}
id = master
function openPorts()
  modem.open(2)
end

--deletes any data in the stations file and replaces it with the data in the stations table
function writeToFile(table)
end


--protocols for this function in the readme file
function call()
_,ourmodem,sendermodem,port,_,id,code,content = event.pull("modem") --wait for a message and save it in these variables
if port == 2 then --stationcontrollers
  if code == "getID" then
    stations[id] == content
    writeToFile(stations)
    modem.send(sendermodem, 2, id ,"getID")
  elseif code == "update" then
    stations[id] == content
    writeToFile(stations)
    modem.send(sendermodem, 2, id, "update")
end
end

--------------------------------------------------------------------------------
openPorts()
while true do
  call()
  os.sleep(1) -- adding latency to remove some lag (can be edited if wanted)
end
