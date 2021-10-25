assert("constants") do
  assert_equal 0x00, Termbox::DEFAULT
  assert_equal 0x01, Termbox::BLACK
  assert_equal 0x02, Termbox::RED
  assert_equal 0x03, Termbox::GREEN
  assert_equal 0x04, Termbox::YELLOW
  assert_equal 0x05, Termbox::BLUE
  assert_equal 0x06, Termbox::MAGENTA
  assert_equal 0x07, Termbox::CYAN
  assert_equal 0x08, Termbox::WHITE

  assert_equal 0x01000000, Termbox::BOLD
  assert_equal 0x02000000, Termbox::UNDERLINE
  assert_equal 0x04000000, Termbox::REVERSE

  assert_equal 0, Termbox::OUTPUT_CURRENT
  assert_equal 1, Termbox::OUTPUT_NORMAL
  assert_equal 2, Termbox::OUTPUT_256
  assert_equal 3, Termbox::OUTPUT_216
  assert_equal 4, Termbox::OUTPUT_GRAYSCALE
  assert_equal 5, Termbox::OUTPUT_TRUECOLOR
end

assert('size') do
  Termbox.init_file("test_term")
  w = Termbox.width
  h = Termbox.height
  assert_equal [w, h], Termbox.size
#  Termbox.shutdown
end

assert('Cell.new with args') do
  cell = Termbox::Cell.new('a')
  assert_equal 'a', cell.ch
  assert_equal 0, cell.fg
  assert_equal 0, cell.bg

  cell = Termbox::Cell.new('b', 2)
  assert_equal 'b', cell.ch
  assert_equal 2, cell.fg
  assert_equal 0, cell.bg

  cell = Termbox::Cell.new('c', 2, 5)
  assert_equal 'c', cell.ch
  assert_equal 2, cell.fg
  assert_equal 5, cell.bg
end
