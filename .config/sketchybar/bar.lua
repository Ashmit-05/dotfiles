local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = false,
  height = 30,
  position = "top",
  -- color = colors.with_alpha(colors.bar.bg, 0.5),
  color = colors.with_alpha(colors.bar.bg, 1),
   padding_right = 1,
  padding_left = 1,
  corner_radius = 20,
  margin = 17,
  y_offset = 3,
   border_width = 2,
  border_color = colors.purple
})
