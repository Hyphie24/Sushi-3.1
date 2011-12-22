--[[
Copyright 2008, 2009, 2010, 2011 João Cardoso
Sushi is distributed under the terms of the GNU General Public License (or the Lesser GPL).
This file is part of Sushi.

Sushi is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Sushi is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Sushi. If not, see <http://www.gnu.org/licenses/>.
--]]

local Handler = LibStub('Poncho-1.0')(nil, 'SushiCallHandler', UIParent)
if not Handler then
	return
end


--[[ Builder ]]--

function Handler:OnAcquire ()
	self.calls = {}
	self:Show()
end

function Handler:OnRelease ()
	self:SetParent(UIParent)
	self:ClearAllPoints()
	self:Hide()
end


--[[ API ]]--

function Handler:SetCall (event, method)
	self.calls[event] = method
end

function Handler:GetCall (event)
	return self.calls[event]
end

function Handler:FireCall (event, ...)
	if self.calls and self.calls[event] then
		self.calls[event](self, ...)
	end
end

Handler.Listen = Handler.SetCall
Handler.Watch = Handler.SetCall