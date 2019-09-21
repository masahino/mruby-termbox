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

  assert_equal 0x0100, Termbox::BOLD
  assert_equal 0x0200, Termbox::UNDERLINE
  assert_equal 0x0400, Termbox::REVERSE

  assert_equal 0, Termbox::OUTPUT_CURRENT
  assert_equal 1, Termbox::OUTPUT_NORMAL
  assert_equal 2, Termbox::OUTPUT_256
  assert_equal 3, Termbox::OUTPUT_216
  assert_equal 4, Termbox::OUTPUT_GRAYSCALE
end