local w, h = term.getSize()
term.clear()
term.setCursorPos(1, 1)
print("TostyOS " .. require("tostyos_version") .. " made by Marcelsky for our private Minecraft Server!")
print("Press any key to go back to the main menu.")
while true do
    local e, _ = os.pullEvent()
    if e == "key" then
        shell.run("/.tostyos/menu.lua")
        break
    end
end
