# OCTrainsystem
I will add a instructional readme once I have a stable release of the project,
However, the code should be pretty well commented so you can understand if you wish.


NOTE ABOUT NETWORKING IN OC
modem_message is formatted like this:
x,x,x,port,x,id,code,content


- Master
One pc should have this program.
gets info about trains leaving and entering stations,
and forwards them to other clients

-Stationcontroller
USES PORT 2 FOR COMMUNICATION




PROTOCOLS

NEW CONTROLLER GETS ID FROM MASTER :     
from con: id = what you want id to be (not a used one), code = "getID" ,content = table containing station info
to   con: id = master                                 , code = "getID"

CHANGE FROM CONTROLLER (train enters/leaves station, new train added etc.)
from con: id = what your ID is (use above)            , code = "update" ,content = table containing station info (updated ofc)
