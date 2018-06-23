local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Arian Number 😑', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Contact To Me 😑', callback_data = '!contact'},
    		    		{text = 'Creator / Allwen / Arian Channel 👥', url = 'https://telegram.me/dragon_wolf_ch'},
	    },
	    {
	    {text = '🔙 Back', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_contact()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'My First Account', url = 'http:/t.me/dragon_wolf'},
    		    		{text = 'My Second Account 😃', url = 'https://telegram.me/dragon_wolf2'},
	    },
	    {
	    {text = '🔙 Back', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
	        {text = 'About Me 👥', callback_data = '!aboutus'},
	        {text = '🔸DrWolf Bot🔹', callback_data = '!robot'},
        }
    }
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🔰 اینجا بزن 🔰', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[📍 *Welcome Dear To My Private Bot ;)*  📍
-------------------------------------------------------------
🗣 `Please select an option ...`]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, 'برای ارتباط با آرین روی دکمه زیر بزن و برو تو ربات 😃😃 ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
if query == 'contact' then
            local text = [[*Try This Ways To Contact Me Directly :)*]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍 *Welcome Dear To My Private Bot ;)*  📍
-------------------------------------------------------------
🗣 `Please select an option ...`]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '09380386206', 'Arian | DragonWolf')
end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)@DragonWolfRobot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:!(home)',
		'^###cb:!(contact)',
	    '^###cb:!(share)',

    }
}
