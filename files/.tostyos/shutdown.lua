os.pullEvent = os.pullEventRaw

term.setCursorPos(1, 1)
print("[?] Are you sure you want to shutdown your computer?")
print("[Y] Yes")
print("[N] No")
while true do
    local e, p = os.pullEvent()
    local key = p
    if e == "key" then
        if key == keys.y then
            os.shutdown()
            break
        elseif key == keys.n then
            print("Cancelled... quitting!")
            sleep(2)
            shell.run("/.tostyos/menu.lua")
            break
        end
    end
end
