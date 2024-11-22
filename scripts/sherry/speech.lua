local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
if TUNING.LANGUAGE == "English" then
    STRINGS.CHARACTERS.SHERRY = require "sherry_new_speech_en"

else
    -- if TUNING.SHERRY_SPEECH == "sherry_new_speech" then
    STRINGS.CHARACTERS.SHERRY = require "sherry_new_speech"
    -- end
end
