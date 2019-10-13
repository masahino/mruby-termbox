$curCol = 0
$curRune = 0
$backbuf = []
$bbw = 0
$bbh = 0

$runes = [
  0x20, # ' '
  0x2591, # '░'
  0x2592, # '▒'
  0x2593, # '▓'
  0x2588, # '█'
  ]

$colors = [
  Termbox::BLACK,
  Termbox::RED,
  Termbox::GREEN,
  Termbox::YELLOW,
  Termbox::BLUE,
  Termbox::MAGENTA,
  Termbox::CYAN,
  Termbox::WHITE,
]

def updateAndDrawButtons(current, x, y, mx, my, n, &attrFunc)
  lx = x
  ly = y
  for i in 0..(n-1)
    if lx <= mx && mx <= lx+3 && ly <= my && my <= ly+1
      current = i
    end
    r, fg, bg = attrFunc.call(i)
    Termbox.change_cell(lx+0, ly+0, r, fg, bg)
    Termbox.change_cell(lx+1, ly+0, r, fg, bg)
    Termbox.change_cell(lx+2, ly+0, r, fg, bg)
    Termbox.change_cell(lx+3, ly+0, r, fg, bg)
    Termbox.change_cell(lx+0, ly+1, r, fg, bg)
    Termbox.change_cell(lx+1, ly+1, r, fg, bg)
    Termbox.change_cell(lx+2, ly+1, r, fg, bg)
    Termbox.change_cell(lx+3, ly+1, r, fg, bg)
    lx += 4
  end
  lx = x
  ly = y
  for i in 0.. (n-1)
    if current == i
      fg = Termbox::RED | Termbox::BOLD
      bg = Termbox::DEFAULT
      Termbox.change_cell(lx+0, ly+2, '^', fg, bg)
      Termbox.change_cell(lx+1, ly+2, '^', fg, bg)
      Termbox.change_cell(lx+2, ly+2, '^', fg, bg)
      Termbox.change_cell(lx+3, ly+2, '^', fg, bg)
    end
    lx += 4
  end
  return current
end

def updateAndRedrawAll(mx, my)
  Termbox.clear
  if mx != -1 && my != -1
    $backbuf[$bbw*my + mx].ch = $runes[$curRune]
    $backbuf[$bbw*my + mx].fg = $colors[$curCol]
  end
  Termbox.set_cell_buffer($backbuf)
  h = Termbox.height
  $curRune = updateAndDrawButtons($curRune, 0, 0, mx, my, $runes.size) do |i|
    [$runes[i], Termbox::DEFAULT, Termbox::DEFAULT]
  end
  $curCol = updateAndDrawButtons($curCol, 0, h-3, mx , my, $colors.size) do |i|
    [' ', Termbox::DEFAULT, $colors[i]]
  end
  Termbox.present
end

def reallocBackBuffer(w, h)
  $bbw = w
  $bbh = h
#  $backbuf = Array.new(w*h, Termbox::Cell.new)
  $backbuf = []
  for i in 0..(w*h-1)
    $backbuf[i] = Termbox::Cell.new
  end
end

def paint
  code = Termbox.init()
  if code < 0
    $stderr.puts "termbox init failed, code: #{code}"
  end

  Termbox.select_input_mode(Termbox::INPUT_ESC | Termbox::INPUT_MOUSE)
  w = Termbox.width
  h = Termbox.height
  reallocBackBuffer(w, h)
  updateAndRedrawAll(-1, -1)
  loop do
    mx = -1
    my = -1
    ev = Termbox.poll_event
    case ev.type
    when Termbox::EVENT_KEY
      if ev.key == Termbox::KEY_ESC
        Termbox.shutdown
        return 0
      end
    when Termbox::EVENT_MOUSE
      if ev.key == Termbox::KEY_MOUSE_LEFT
        mx = ev.x
        my = ev.y
      end
    when Termbox::EVENT_RESIZE
      reallocBackBuffer(ev.w, ev.h)
    end
    updateAndRedrawAll(mx, my)
  end
end

paint