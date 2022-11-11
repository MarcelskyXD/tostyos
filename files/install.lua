os.pullEvent = os.pullEventRaw

local function gitFile(path)
    print("Downloading: "..path)
    local download = http.get("https://raw.githubusercontent.com/MarcelskyXD/tostyos/main/files/"..path)
    local data = download.readAll()
    download.close()
 
    local file = fs.open(path,"w")
    file.write(data)
    file.close()
    print(path.." finished downloading.")
end

local function downloadOS()
    gitFile("")
end

term.setCursorPos(1, 1)
print("[?] Are you sure you want to install TostyOS?")
print("")
print("[Y] Yes")
print("[N] No")
print("")
print("Press key to select option.")
while true do
    local e, p = os.pullEvent()
    local key = p
    if e == "key" then
        if key == keys.y then
            downloadOS()
            break
        elseif key == keys.n then
            print("Cancelled... quitting!")
            break
        end
    end
end
