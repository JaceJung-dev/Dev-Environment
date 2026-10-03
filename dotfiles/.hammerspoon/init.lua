-- key mapping for vim 
-- Convert input source as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
local inputEnglish = "com.apple.keylayout.ABC"
local inputKorean = "com.apple.inputmethod.Korean.2SetKorean"
local esc_bind

function convert_to_eng_with_esc()
    local inputSource = hs.keycodes.currentSourceID()
    if not (inputSource == inputEnglish) then
        hs.eventtap.keyStroke({}, 'right')
        hs.keycodes.currentSourceID(inputEnglish)
    end
    esc_bind:disable()
    hs.eventtap.keyStroke({}, 'escape')
    esc_bind:enable()
end

esc_bind = hs.hotkey.new({}, 'escape', convert_to_eng_with_esc):enable()

hs.alert.show("Hammerspoon Config Loaded")