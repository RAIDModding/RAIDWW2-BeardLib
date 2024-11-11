HUDNotification.CUSTOM_ACHIEVEMENT = "custom_achievement"
HUDNotificationCustomAchievement = HUDNotificationCustomAchievement or class(HUDNotification)
HUDNotification.TYPES[HUDNotification.CUSTOM_ACHIEVEMENT] = HUDNotificationCustomAchievement

HUDNotificationCustomAchievement.FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDNotificationCustomAchievement.FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDNotificationCustomAchievement.PADDING = 10

function HUDNotificationCustomAchievement:init(notification_data)
    self.super.init(self, notification_data)

    self._text:set_font(Idstring(self.FONT))
    self._text:set_font_size(self.FONT_SIZE)

    self._text:set_valign("top")
    local _, _, _, text_h = self._text:text_rect()
    self._text:set_h(text_h)

    if notification_data.icon then
        self._icon = self._object:bitmap({
            y = self.PADDING,
            layer = 2,
            texture = notification_data.icon,
            color = notification_data.icon_color,
            vertical = "center",
            w = 64,
            h = 64
        })
        self._icon:set_center_x(self._object:w() / 2)
        self._text:set_y((self.PADDING * 2) + self._icon:h())
        self._object:set_h((self.PADDING * 3) + self._icon:h() + text_h)
    else
        self._text:set_y(self.PADDING)
        self._object:set_h((self.PADDING * 2) + text_h)
    end

    self._bg_texture:set_h(self._object:h())

    self._font_size = self.FONT_SIZE
    self._panel_shape_h = self._object:h()
end
