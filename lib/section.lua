local Section = { x_div = 1, y_div = 4, active_x = 1, active_y = 1, x_step = 1, y_step = 1, x_offset = 0 }

function Section:new(o)
    o = setmetatable(o or {}, Section)
    self.__index = self
    return o
end

function Section:tick()
    self:tick_x()
    self:tick_y()
end

function Section:set_x_div_delta(delta)
    self.x_div = util.clamp(self.x_div + delta, 1, 32)
end

function Section:set_y_div_delta(delta)
    self.y_div = util.clamp(self.y_div + delta, 1, 32)
end

function Section:tick_x()
    if self.x_div == 1 then
        self.active_x = self.active_x % 4 + 1
    else
        self.x_step = self.x_step % self.x_div + 1
        if self.x_step % self.x_div == 1 then
            self.active_x = self.active_x % 4 + 1
        end
    end
end

function Section:tick_y()
    if self.y_div == 1 then
        self.active_y = self.active_y % 4 + 1
    else
        self.y_step = self.y_step % self.y_div + 1
        if self.y_step % self.y_div == 1 then
            self.active_y = self.active_y % 4 + 1
        end
    end
end

return Section
