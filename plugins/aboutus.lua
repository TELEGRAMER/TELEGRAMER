local function do_keyboard_aboutus()
    local keyboard = {}
    keyboard.inline_keyboard = {
			{
	    {text = '🔙 Back', callback_data = '!home'},
	    }
    }
    return keyboard
end
local action = function(msg,blocks)
local msg_id = msg.message_id
local chat = msg.chat.id
local query = blocks[1]
    if msg.cb then
	if query == 'aboutus' then
		local keyboard = do_keyboard_aboutus()
		local text = [['😁من برنامه نویس لوا هستم/بودم..۲ سال پیش شاید از محبوب ها بودم و رفیق هایی داشتم..به دلایلی از این کار منصرف شدم ولی الان دوباره شروع کردم و دارم با عضو شدن در تیم های قوی تمامی قدرتم رو ب دست آورم 😃اگه تیمی داری و میخوای توش باشم،میتونی از این ربات بهم پیام بفرستی... 🙃']
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	end
	end
return {
  action = action,
triggers = {
	    '^###cb:!(aboutus)',
    }
}