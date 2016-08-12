--read the readme provided with this project to get more info about this file
--and how it should be installed/used

local component = require("component")
modem = component.modem


stations = {}

id = master


function openPorts()
  modem.open(2)
end

--write the station info to a file
function writeToFile(table, filepath)
  io.open(filepath, "a")
  io.write() --clears file
  for i,v in pairs(table) do
    io.write(tostring(v))
  end
  io.close()
  print("Written to file")
end


--protocols for this function in the readme file
function call()
_,ourmodem,sendermodem,port,_,id,code,content = event.pull("modem") --wait for a message and save it in these variables
if port == 2 then --stationcontrollers
  if code == "getID" then
    stations[id] = content
    writeToFile(stations)
    modem.send(sendermodem, 2, id ,"getID")
  elseif code == "update" then
    stations[id] = content
    writeToFile(stations)
    modem.send(sendermodem, 2, id, "update")
end
end
end

--------------------------------------------------------------------------------
openPorts()
testtable = {"Iloce" , "Tuesday"}
writeToFile(table, "test.txt")
--while true do
  --call()
  --os.sleep(1) -- adding latency to remove some lag (can be edited if wanted)
--end
