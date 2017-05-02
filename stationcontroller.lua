local component = require ("component")
local event = require ("event")
rs = component.redstone
modem = component.modem

--vars


--
function check()
  local _, _, from, port, _, message = event.pull("modem_message")
 
 
end

modem.open(5)

while true do
  check()
  os.sleep(0.5)
end
