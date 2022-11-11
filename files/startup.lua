local module_folder = "/.tostyos/lib/"
package.path = module_folder .. "?.lua;" .. package.path

local version = require("tostyos_version")

term.clear()
term.setCursorPos(1,1)
print("Welcome to TostyOS Version "..version)
print("Loading TostyOS kernel!")
textutils.slowPrint("[###########]",7)
term.setCursorPos(16, 3)
term.write("Finished!")
term.setCursorPos(1,4)
sleep(1)
print("Loaded TostyOS Kernel, loading drivers...")
sleep(1)
textutils.slowPrint("[###########]", 10)
term.setCursorPos(16,5)
term.write("Finished!")
term.setCursorPos(1, 6)
sleep(1)
print("Loaded TostyOS Drivers succesfully. Loading UI")
sleep(2)
shell.run(".tostyos/menu.lua")
