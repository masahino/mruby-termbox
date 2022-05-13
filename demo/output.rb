$chars = "nnnnnnnnnbbbbbbbbbuuuuuuuuuiiiiiiiiiBBBBBBBBB"

$all_attrs = [
  0,
  Termbox::BOLD,
  Termbox::UNDERLINE,
  Termbox::ITALIC,
  Termbox::BOLD | Termbox::UNDERLINE | Termbox::ITALIC,
  ]

def next_char(current)
  current += 1
  if !$chars[current]
    current = 0
  end
  current
end

def draw_line(x, y, bg)
  current_char = 0
  for a in 0..4
    for c in Termbox::DEFAULT..Termbox::WHITE
      fg = $all_attrs[a] | c
      Termbox.change_cell(x, y, $chars[current_char], fg, bg)
      current_char = next_char(current_char)
      x += 1
    end
  end
end

def print_combnations_table(sx, sy, attrs)
  for i in 0..attrs.size-1
    for c in Termbox::DEFAULT..Termbox::WHITE
      bg = attrs[i] | c
      draw_line(sx, sy, bg)
      sy += 1
    end
  end
end

def draw_all
  Termbox.clear

  Termbox.select_output_mode(Termbox::OUTPUT_NORMAL)
  col1 = [0, Termbox::BOLD]
  col2 = [Termbox::REVERSE]
  print_combnations_table(1, 1, col1)
  print_combnations_table(2 + $chars.length, 1, col2)
  Termbox.present

  Termbox.select_output_mode(Termbox::OUTPUT_GRAYSCALE)
  y = 23
  for x in 0..23
    Termbox.change_cell(x, y, '@', x, 0)
    Termbox.change_cell(x + 25, y, ' ', 0, x)
  end
  Termbox.present

  Termbox.select_output_mode(Termbox::OUTPUT_216)
  y += 1
  x = 0
  for c in 0..215
    if x % 24 == 0
      x = 0
      y += 1
    end
    Termbox.change_cell(x, y, '@', c, 0)
    Termbox.change_cell(x + 25, y, ' ', 0, c)
    x += 1
  end
  Termbox.present

  Termbox.select_output_mode(Termbox::OUTPUT_256)
  y += 1
  x = 0
  for c in 0..255
    if x % 24 == 0
      x = 0
      y += 1
    end
    Termbox.change_cell(x, y, '+', c | ((y % 2 == 1)? Termbox::UNDERLINE : 0), 0)
    Termbox.change_cell(x + 25, y, ' ', 0, c)
    x += 1
  end
  Termbox.present
end

ret = Termbox.init
if ret < 0
  $stderr.printf "Termbox.init failed with error code %d\n", ret
end

draw_all

 while ev = Termbox.poll_event
  case ev.type
  when Termbox::EVENT_KEY
    case ev.key
    when Termbox::KEY_ESC
      Termbox.shutdown
      break
    end
  when Termbox::EVENT_RESIZE
    draw_all
  end
end

