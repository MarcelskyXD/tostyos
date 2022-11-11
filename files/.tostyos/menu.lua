os.pullEvent = os.pullEventRaw
local version = require("tostyos_version")
local w, h = term.getSize()

function printCentered(y, s)
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x, y)
   term.clearLine()
   term.write(s)
end

local nOption = 1

local function drawMenu()
   term.clear()
   term.setCursorPos(1, 1)
   term.write("TostyOS " .. version)
   term.setCursorPos(1, 2)
   shell.run("id")

   term.setCursorPos(w - 11, 1)
   if nOption == 1 then
      term.write("Command line")
   elseif nOption == 2 then
      term.write("Programs")
   elseif nOption == 3 then
      term.write("Shutdown")
   elseif nOption == 4 then
      term.write("About")
   else
   end

end

--GUI
term.clear()
local function drawFrontend()
   printCentered(math.floor(h / 2) - 3, "")
   printCentered(math.floor(h / 2) - 2, "Start Menu")
   printCentered(math.floor(h / 2) - 1, "")
   printCentered(math.floor(h / 2) + 0, ((nOption == 1) and "[ Command line ]") or "Command line")
   printCentered(math.floor(h / 2) + 1, ((nOption == 2) and "[ Programs ]") or "Programs")
   printCentered(math.floor(h / 2) + 2, ((nOption == 3) and "[ Shutdown ]") or "Shutdown")
   printCentered(math.floor(h / 2) + 3, ((nOption == 4) and "[ About ]") or "About")
   printCentered(math.floor(h / 2) + 4, "")
end

--Display
drawMenu()
drawFrontend()

while true do
   local e, p = os.pullEvent()
   if e == "key" then
      local key = p
      if key == 17 or key == 200 then

         if nOption > 1 then
            nOption = nOption - 1
            drawMenu()
            drawFrontend()
         end
      elseif key == 31 or key == 208 then
         if nOption < 4 then
            nOption = nOption + 1
            drawMenu()
            drawFrontend()
         end
      elseif key == 28 then
         break
      end
   end
end
term.clear()

--Conditions
if nOption == 1 then
   shell.run("/.tostyos/command.lua")
elseif nOption == 2 then
   shell.run("/.tostyos/programs.lua")
elseif nOption == 3 then
   shell.run("/.tostyos/shutdown.lua")
else
   shell.run("/.tostyos/about.lua")
end
