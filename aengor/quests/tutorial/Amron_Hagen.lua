-- items: 18709, 13509, 13913, 17804
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	-- character still has wayfarer's coin
	if e.other:HasItem(1377) then
		e.other:Message(MT.Yellow, "Amron Hagen, with just one quick glance, seems to have fully assessed you. With a bright smile he turns to you, 'Welcome to The Origin adventurer! This is the place where it all started and here we shall begin again!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, "..e.other:GetName()..".  Welcome to The Origin. This is where it all began and this is where you shall begin again.  I am Amron Hagen, a humble servant of the great Tunare.  If you are new to this world, you should seek out the guild masters and trainers to learn your trade.  Once you have done so, return to me and I shall reward you with some gifts to help you on your way.  Just say the word 'reward' when you are ready.");
	elseif(e.message:findi("add class")) then
		e.self:Say("Ok then, attempting to add DRUID...");
		e.other:AddExtraClass(6);
		if(e.other:HasClassID(6)) then
			e.self:Say("It worked!");
		end
	end
end


function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1377})) then
		e.self:Say("Here, please take these welcome gifts. They shall be of great use in your adventures");
		e.other:SummonItem(1801); -- Item: Wayfarer's Apprentice Coin
		e.other:SummonItem(1378); -- Item: Small Splinter of the Sky
		e.other:SummonItem(1800); -- Item: Small Splinter of Destruction
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	e.self:DoAnim(9); -- bow
end

-- EOF zone: tutorial ID: 3032 NPC: Amron_Hagen
