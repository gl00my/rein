local spr = {[[
---------------*
  -**-**--
  *--*--*-
  *-----*-
  -*---*--
  --*-*---
  ---*----
  --------
  --------
]], [[
---------------*
  -**-**--
  *******-
  *******-
  -*****--
  --***---
  ---*----
  --------
  --------
]]
}
local w, h = screen:size()
stars = {}

for i=1, #spr do
  spr[i] = gfx.new(spr[i])
end

for i=1, 128 do
  table.insert(stars, {
    x = math.random(w),
    y = math.random(h),
    c = math.random(16),
    s = math.random(8),
  })
end

local frames = 0
local txt = ''

local function showkeys()
  local t = ''
  local k = { 'left', 'right', 'up', 'down', 'space', 'z', 'x' }
  for _, v in ipairs(k) do
    if input.keydown(v) then
      t = t .. v .. ' '
    end
  end
  return t
end

mixer.voices [[
  voice bass
  box synth
  fmul 0.5
  type square
  width 0
  decay 0.2
  sustain 0
  release 0.01
  volume 0.5
  lfo_assign 0 freq
  lfo_type 0 saw
  lfo_freq 0 15
  lfo_low 0 100
  lfo_high 0 -100
  lfo_set_loop 0 0
  lfo_assign 1 width
  lfo_type 1 saw
  lfo_freq 1 15
  lfo_low 1 0.5
  lfo_high 1 -0.5
  lfo_set_loop 1 0

  voice snare
  box synth
  type sin_band_noise
  set_lin 1
  amp 1
  offset 10000
  width 10000
  fmul 0.4
  decay 0.15
  sustain 0
  release 0
  remap freq freq2
  lfo_assign 0 freq2
  lfo_type 0 saw
  lfo_freq 0 5
  lfo_low 0 150
  lfo_high 0 0
  lfo_set_loop 0 0
  lfo_assign 1 freq
  lfo_type 1 saw
  lfo_freq 1 5
  lfo_low 1 10000
  lfo_high 1 5000
  lfo_set_loop 1 0

  voice square
  box synth
  type square
  set_glide 50
  width 0.7

  voice saw
  box synth
  type saw
  attack 0.5
  decay 0.5
  sustain 0.5
  box delay
  volume 1
  feedback 0.5
  time 0.2
  box dist
  gain 1
  box filter
  type lowpass
  width 0.1
  volume 1
]]

local song = [[
@temp 16
@voice 1 bass
@voice 2 snare
@voice 3 square
@voice 4 saw
@volume -1 0.8
@pan -1 0
@pan 3 -0.75
@pan 4 0.75
C-2 A0 | ... .. | C-4 .. | C-3 64
... .. | ... .. | G-3 45 | ... ..
C-2 80 | ... .. | C-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | C-3 80 | D-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | ... .. | D-4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 A0 | ... .. | D#4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 80 | ... .. | D#4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | C-3 80 | F-4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | ... .. | G-4 .. | ... ..
... .. | C-3 80 | F-4 45 | ... ..
C-2 A0 | ... .. | C-4 .. | ... ..
... .. | ... .. | G-4 45 | ... ..
C-2 80 | ... .. | C-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | C-3 80 | D-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | ... .. | D-4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 A0 | ... .. | D#4 .. | D-3 64
... .. | C-3 80 | D-4 45 | ... ..
C-2 80 | ... .. | D#4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | C-3 80 | D-4 .. | D#3 64
... .. | ... .. | D#4 45 | ... ..
C-2 A0 | ... .. | G-3 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 A0 | ... .. | C-4 .. | G#2 64
... .. | ... .. | G-3 45 | ... ..
C-2 80 | ... .. | C-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | C-3 80 | D-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | ... .. | D-4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 A0 | ... .. | D#4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 80 | ... .. | D#4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | C-3 80 | F-4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | ... .. | G-4 .. | ... ..
... .. | C-3 80 | F-4 45 | ... ..
C-2 a0 | ... .. | C-4 .. | ... ..
... .. | ... .. | G-4 45 | ... ..
C-2 80 | ... .. | C-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
... .. | C-3 80 | D-4 .. | ... ..
... .. | ... .. | C-4 45 | ... ..
C-2 A0 | ... .. | D-4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 a0 | ... .. | D#4 .. | ... ..
... .. | C-3 80 | D-4 45 | ... ..
C-2 80 | ... .. | D#4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | C-3 80 | D-4 .. | ... ..
... .. | ... .. | D#4 45 | ... ..
... .. | ... .. | G-3 .. | ... ..
... .. | ... .. | D-4 45 | ... ..
]]
mixer.volume(0.5)
mixer.new('music', song)
mixer.play('music', -1)

local s = gfx.new
[[
--------8
------8
-----8-
----8--
---8---
--8----
-8-----
8------
]];

function draw_text(txt, xx, yy, scale, col)
  local s = font:text(txt, 7)
  local w, h = s:size()
  local r, g, b, a
  for y=0,h-1 do
    for x=0,w-1 do
      r, g, b, a = s:val(x, y)
      if a > 128 then
        screen:fill(xx + x*scale, yy + y*scale, scale, scale, col)
      end
    end
  end
end

local fps = 0

while true do
  screen:clear(0)
  draw_text("REIN", 70, 100, 4, s)
  gfx.printf(108, 140, 1, VERSION)
  screen:offset(math.floor(math.sin(frames * 0.1)*6), math.floor(math.cos(frames * 0.1)*6))
  spr[math.floor(frames/10)%2+1]:blend(screen, 240, 0)

  local mx, my, mb = input.mouse()
  local a, b = sys.input()

  if a == 'text' then
    txt = txt .. b
  elseif a == 'keydown' and b == 'return' then
    txt = txt .. '\n'
  elseif a == 'keydown' and b == 'backspace' then
    txt = ''
  end

  gfx.printf(0, 0, 15, "FPS:%d\nMouse:%d,%d %s\nKeys:%s\nInp:%s",
    fps, mx, my, mb.left and 'left' or '',
    showkeys(), txt..'\1')

  for k, v in ipairs(stars) do
    screen:pixel(v.x, v.y, v.c)
    stars[k].y = v.y + v.s
    if stars[k].y > h then
      stars[k].y = 0
      stars[k].x = math.random(w)
    end
  end
  fps = gfx.flip(1/50)
  frames = frames + 1
end
