assert('utf8_char_length') do
  assert_equal 1, Termbox.utf8_char_length('a')
  assert_equal 3, Termbox.utf8_char_length('あ')
end

assert('utf8_char_to_unicode') do
  assert_equal 97, Termbox.utf8_char_to_unicode('a')
  assert_equal 0x3042, Termbox.utf8_char_to_unicode('あ')
end