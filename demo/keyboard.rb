class Key
  attr_accessor :x, :y, :ch
  def initialize(x, y, ch)
    @x = x
    @y = y
    @ch = ch
  end  
end
$key = {
  'ESC' => [[1,1,'E'],[2,1,'S'],[3,1,'C']],
  'F1' => [[6,1,'F'],[7,1,'1']],
  'F2' => [[9,1,'F'],[10,1,'2']],
  'F3' => [[12,1,'F'],[13,1,'3']],
  'F4' => [[15,1,'F'],[16,1,'4']],
  'F5' => [[19,1,'F'],[20,1,'5']],
  'F6' => [[22,1,'F'],[23,1,'6']],
  'F7' => [[25,1,'F'],[26,1,'7']],
  'F8' => [[28,1,'F'],[29,1,'8']],
  'F9' => [[33,1,'F'],[34,1,'9']],
  'F10' => [[36,1,'F'],[37,1,'1'],[38,1,'0']],
  'F11' => [[40,1,'F'],[41,1,'1'],[42,1,'1']],
  'F12' => [[44,1,'F'],[45,1,'1'],[46,1,'2']],
  'PRN' => [[50,1,'P'],[51,1,'R'],[52,1,'N']],
  'SCR' => [[54,1,'S'],[55,1,'C'],[56,1,'R']],
  'BRK' => [[58,1,'B'],[59,1,'R'],[60,1,'K']],
  'LED1' => [[66,1,'-']],
  'LED2' => [[70,1,'-']],
  'LED3' => [[74,1,'-']],

  'TILDE' => [[1,4,'`']],
  'TILDE_SHIFT' => [[1,4,'~']],
  '1' => [[4,4,'1']],
  '1_SHIFT' => [[4,4,'!']],
  '2' => [[7,4,'2']],
  '2_SHIFT' => [[7,4,'@']],
  '3' => [[10,4,'3']],
  '3_SHIFT' => [[10,4,'#']],
  '4' => [[13,4,'4']],
  '4_SHIFT' => [[13,4,'$']],
  '5' => [[16,4,'5']],
  '5_SHIFT' => [[16,4,'%']],
  '6' => [[19,4,'6']],
  '6_SHIFT' => [[19,4,'^']],
  '7' => [[22,4,'7']],
  '7_SHIFT' => [[22,4,'&']],
  '8' => [[25,4,'8']],
  '8_SHIFT' => [[25,4,'*']],
  '9' => [[28,4,'9']],
  '9_SHIFT' => [[28,4,'(']],
  '0' => [[31,4,'0']],
  '0_SHIFT' => [[31,4,')']],
  'MINUS' => [[34,4,'-']],
  'MINUS_SHIFT' => [[34,4,'_']],
  'EQUALS' => [[37,4,'=']],
  'EQUALS_SHIFT' => [[37,4,'+']],
  'BACKSLASH' => [[40,4,'\\']],
  'BACKSLASH_SHIFT' => [[40,4,'|']],
  'BACKSPACE' => [[44,4,0x2190],[45,4,0x2500],[46,4,0x2500]],
  'INS' => [[50,4,'I'],[51,4,'N'],[52,4,'S']],
  'HOM' => [[54,4,'H'],[55,4,'O'],[56,4,'M']],
  'PGU' => [[58,4,'P'],[59,4,'G'],[60,4,'U']],
  'K_NUMLOCK' => [[65,4,'N']],
  'K_SLASH' => [[68,4,'/']],
  'K_STAR' => [[71,4,'*']],
  'K_MINUS' => [[74,4,'-']],

  'TAB' => [[1,6,'T'],[2,6,'A'],[3,6,'B']],
  'q' => [[6,6,'q']],
  'Q' => [[6,6,'Q']],
  'w' => [[9,6,'w']],
  'W' => [[9,6,'W']],
  'e' => [[12,6,'e']],
  'E' => [[12,6,'E']],
  'r' => [[15,6,'r']],
  'R' => [[15,6,'R']],
  't' => [[18,6,'t']],
  'T' => [[18,6,'T']],
  'y' => [[21,6,'y']],
  'Y' => [[21,6,'Y']],
  'u' => [[24,6,'u']],
  'U' => [[24,6,'U']],
  'i' => [[27,6,'i']],
  'I' => [[27,6,'I']],
  'o' => [[30,6,'o']],
  'O' => [[30,6,'O']],
  'p' => [[33,6,'p']],
  'P' => [[33,6,'P']],
  'LSQB' => [[36,6,'[']],
  'LCUB' => [[36,6,'[']],
  'RSQB' => [[39,6,']']],
  'RCUB' => [[39,6,']']],
  'ENTER' => [
  [43,6,0x2591],[44,6,0x2591],[45,6,0x2591],[46,6,0x2591],
  [43,7,0x2591],[44,7,0x2591],[45,7,0x21B5],[46,7,0x2591],
  [41,8,0x2591],[42,8,0x2591],[43,8,0x2591],[44,8,0x2591],
  [45,8,0x2591],[46,8,0x2591]
  ],
  'DEL' => [[50,6,'D'],[51,6,'E'],[52,6,'L']],
  'END' => [[54,6,'E'],[55,6,'N'],[56,6,'D']],
  'PGD' => [[58,6,'P'],[59,6,'G'],[60,6,'D']],
  'K_7' => [[65,6,'7']],
  'K_8' => [[68,6,'8']],
  'K_9' => [[71,6,'9']],
  'K_PLUS' => [[74,6,' '],[74,7,'+'],[74,8,' ']],

  'CAPS' => [[1,8,'C'],[2,8,'A'],[3,8,'P'],[4,8,'S']],
  'a' => [[7,8,'a']],
  'A' => [[7,8,'A']],
  's' => [[10,8,'s']],
  'S' => [[10,8,'S']],
  'd' => [[13,8,'d']],
  'D' => [[13,8,'D']],
  'f' => [[16,8,'f']],
  'F' => [[16,8,'F']],
  'g' => [[19,8,'g']],
  'G' => [[19,8,'G']],
  'h' => [[22,8,'h']],
  'H' => [[22,8,'H']],
  'j' => [[25,8,'j']],
  'J' => [[25,8,'J']],
  'k' => [[28,8,'k']],
  'K' => [[28,8,'K']],
  'l' => [[31,8,'l']],
  'L' => [[31,8,'L']],
  'SEMICOLON' => [[34,8,';']],
  'PARENTHESIS' => [[34,8,':']],
  'QUOTE' => [[37,8,'\'']],
  'DOUBLEQUOTE' => [[37,8,'"']],
  'K_4' => [[65,8,'4']],
  'K_5' => [[68,8,'5']],
  'K_6' => [[71,8,'6']],

  'LSHIFT' => [[1,10,'S'],[2,10,'H'],[3,10,'I'],[4,10,'F'],[5,10,'T']],
  'z' => [[9,10,'z']],
  'Z' => [[9,10,'Z']],
  'x' => [[12,10,'x']],
  'X' => [[12,10,'X']],
  'c' => [[15,10,'c']],
  'C' => [[15,10,'C']],
  'v' => [[18,10,'v']],
  'V' => [[18,10,'V']],
  'b' => [[21,10,'b']],
  'B' => [[21,10,'B']],
  'n' => [[24,10,'n']],
  'N' => [[24,10,'N']],
  'm' => [[27,10,'m']],
  'M' => [[27,10,'M']],
  'COMMA' => [[30,10,',']],
  'LANB' => [[30,10,'<']],
  'PERIOD' => [[33,10,'.']],
  'RANB' => [[33,10,'>']],
  'SLASH' => [[36,10,'/']],
  'QUESTION' => [[36,10,'?']],
  'RSHIFT' => [[42,10,'S'],[43,10,'H'],[44,10,'I'],[45,10,'F'],[46,10,'T']],
  'ARROW_UP' => [[54,10,'('],[55,10,0x2191],[56,10,')']],
  'K_1' => [[65,10,'1']],
  'K_2' => [[68,10,'2']],
  'K_3' => [[71,10,'3']],
  'K_ENTER' => [[74,10,0x2591],[74,11,0x2591],[74,12,0x2591]],

  'LCTRL' => [[1,12,'C'],[2,12,'T'],[3,12,'R'],[4,12,'L']],
  'LWIN' => [[6,12,'W'],[7,12,'I'],[8,12,'N']],
  'LALT' => [[10,12,'A'],[11,12,'L'],[12,12,'T']],
  'SPACE' => [
    [14,12,' '],[15,12,' '],[16,12,' '],[17,12,' '],[18,12,' '],
    [19,12,'S'],[20,12,'P'],[21,12,'A'],[22,12,'C'],[23,12,'E'],
    [24,12,' '],[25,12,' '],[26,12,' '],[27,12,' '],[28,12,' '],
    ],
  'RALT' => [[30,12,'A'],[31,12,'L'],[32,12,'T']],
  'RWIN' => [[34,12,'W'],[35,12,'I'],[36,12,'N']],
  'RPROP' => [[38,12,'P'],[39,12,'R'],[40,12,'O'],[41,12,'P']],
  'RCTRL' => [[43,12,'C'],[44,12,'T'],[45,12,'R'],[46,12,'L']],
  'ARROW_LEFT' => [[50,12,'('],[51,12,0x2190],[52,12,')']],
  'ARROW_DOWN' => [[54,12,'('],[55,12,0x2193],[56,12,')']],
  'ARROW_RIGHT' => [[58,12,'('],[59,12,0x2192],[60,12,')']],
  'K_0' => [[65,12,' '],[66,12,'0'],[67,12,' '],[68,12,' ']],
  'K_PERIOD' => [[71,12,'.']],
}

$combos = [
  [$key['TILDE'],$key['2'],$key['LCTRL'],$key['RCTRL']],
  [$key['A'],$key['LCTRL'],$key['RCTRL']],
  [$key['B'],$key['LCTRL'],$key['RCTRL']],
  [$key['C'],$key['LCTRL'],$key['RCTRL']],
  [$key['D'],$key['LCTRL'],$key['RCTRL']],
  [$key['E'],$key['LCTRL'],$key['RCTRL']],
  [$key['F'],$key['LCTRL'],$key['RCTRL']],
  [$key['G'],$key['LCTRL'],$key['RCTRL']],
  [$key['H'],$key['BACKSPACE'],$key['LCTRL'],$key['RCTRL']],
  [$key['I'],$key['TAB'],$key['LCTRL'],$key['RCTRL']],
  [$key['J'],$key['LCTRL'],$key['RCTRL']],
  [$key['K'],$key['LCTRL'],$key['RCTRL']],
  [$key['L'],$key['LCTRL'],$key['RCTRL']],
  [$key['M'],$key['ENTER'],$key['K_ENTER'],$key['LCTRL'],$key['RCTRL']],
  [$key['N'],$key['LCTRL'],$key['RCTRL']],
  [$key['O'],$key['LCTRL'],$key['RCTRL']],
  [$key['P'],$key['LCTRL'],$key['RCTRL']],
  [$key['Q'],$key['LCTRL'],$key['RCTRL']],
  [$key['R'],$key['LCTRL'],$key['RCTRL']],
  [$key['S'],$key['LCTRL'],$key['RCTRL']],
  [$key['T'],$key['LCTRL'],$key['RCTRL']],
  [$key['U'],$key['LCTRL'],$key['RCTRL']],
  [$key['V'],$key['LCTRL'],$key['RCTRL']],
  [$key['W'],$key['LCTRL'],$key['RCTRL']],
  [$key['X'],$key['LCTRL'],$key['RCTRL']],
  [$key['Y'],$key['LCTRL'],$key['RCTRL']],
  [$key['Z'],$key['LCTRL'],$key['RCTRL']],
  [$key['LSQB'],$key['ESC'],$key['3'],$key['LCTRL'],$key['RCTRL']],
  [$key['4'],$key['BACKSLASH'],$key['LCTRL'],$key['RCTRL']],
  [$key['RSQB'],$key['5'],$key['LCTRL'],$key['RCTRL']],
  [$key['6'],$key['LCTRL'],$key['RCTRL']],
  [$key['7'],$key['SLASH'],$key['MINUS_SHIFT'],$key['LCTRL'],$key['RCTRL']],
  [$key['SPACE']],
  [$key['1_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['DOUBLEQUOTE'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['3_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['4_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['5_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['7_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['QUOTE']],
  [$key['9_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['0_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['8_SHIFT'],$key['K_STAR'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['EQUALS_SHIFT'],$key['K_PLUS'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['COMMA']],
  [$key['MINUS'],$key['K_MINUS']],
  [$key['PERIOD'],$key['K_PERIOD']],
  [$key['SLASH'],$key['K_SLASH']],
  [$key['0'],$key['K_0']],
  [$key['1'],$key['K_1']],
  [$key['2'],$key['K_2']],
  [$key['3'],$key['K_3']],
  [$key['4'],$key['K_4']],
  [$key['5'],$key['K_5']],
  [$key['6'],$key['K_6']],
  [$key['7'],$key['K_7']],
  [$key['8'],$key['K_8']],
  [$key['9'],$key['K_9']],
  [$key['PARENTHESIS'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['SEMICOLON']],
  [$key['LANB'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['EQUALS']],
  [$key['RANB'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['QUESTION'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['2_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['A'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['B'],$key['SHIFT'],$key['RSHIFT']],
  [$key['C'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['D'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['E'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['F'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['G'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['H'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['I'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['J'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['K'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['L'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['M'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['N'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['O'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['P'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['Q'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['R'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['S'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['T'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['U'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['V'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['W'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['X'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['Y'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['Z'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['LSQB']],
  [$key['BACKSLASH']],
  [$key['RSQB']],
  [$key['6_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['MINUS_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['TILDE']],
  [$key['a']],
  [$key['b']],
  [$key['c']],
  [$key['d']],
  [$key['e']],
  [$key['f']],
  [$key['g']],
  [$key['h']],
  [$key['i']],
  [$key['j']],
  [$key['k']],
  [$key['l']],
  [$key['m']],
  [$key['n']],
  [$key['o']],
  [$key['p']],
  [$key['q']],
  [$key['r']],
  [$key['s']],
  [$key['t']],
  [$key['u']],
  [$key['v']],
  [$key['w']],
  [$key['x']],
  [$key['y']],
  [$key['z']],
  [$key['LCUB'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['BACKSLASH_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['RCUB'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['TILDE_SHIFT'],$key['LSHIFT'],$key['RSHIFT']],
  [$key['8'],$key['BACKSPACE'],$key['LCTRL'],$key['RCTRL']]
  ]

$func_combos = [
  [$key['F1']],
  [$key['F2']],
  [$key['F3']],
  [$key['F4']],
  [$key['F5']],
  [$key['F6']],
  [$key['F7']],
  [$key['F8']],
  [$key['F10']],
  [$key['F11']],
  [$key['F12']],
  [$key['INS']],
  [$key['DEL']],
  [$key['HOM']],
  [$key['END']],
  [$key['PGU']],
  [$key['PGD']],
  [$key['ARROW_UP']],
  [$key['ARROW_DOWN']],
  [$key['ARROW_LEFT']],
  [$key['ARROW_RIGHT']]
]

def print_tb(str, x, y, fg, bg)
  str.each_char do |c|
    uni = Termbox.utf8_char_to_unicode(c)
    Termbox.change_cell(x, y, uni, fg, bg)
    x += 1
  end
end

def printf_tb(x, y, fg, bg, fmt, *args)
  buf = fmt % args
  print_tb(buf, x, y, fg, bg)
end

def draw_key(keys, fg, bg)
  keys.each do |k|
    Termbox.change_cell(k[0]+2, k[1]+4, k[2], fg, bg)
  end
end

def draw_keyboard
  Termbox.change_cell(0, 0, 0x250C, Termbox::WHITE, Termbox::DEFAULT)
  Termbox.change_cell(79, 0, 0x2510, Termbox::WHITE, Termbox::DEFAULT)
  Termbox.change_cell(0, 23, 0x2514, Termbox::WHITE, Termbox::DEFAULT)
  Termbox.change_cell(79, 23, 0x2518, Termbox::WHITE, Termbox::DEFAULT)

  for i in 1..78
    Termbox.change_cell(i, 0, 0x2500, Termbox::WHITE, Termbox::DEFAULT)
    Termbox.change_cell(i, 23, 0x2500, Termbox::WHITE, Termbox::DEFAULT)
    Termbox.change_cell(i, 17, 0x2500, Termbox::WHITE, Termbox::DEFAULT)
    Termbox.change_cell(i, 4, 0x2500, Termbox::WHITE, Termbox::DEFAULT)
  end
  for i in 1..22
    Termbox.change_cell(0, i, 0x2502, Termbox::WHITE, Termbox::DEFAULT)
    Termbox.change_cell(79, i, 0x2502, Termbox::WHITE, Termbox::DEFAULT)
  end
  Termbox.change_cell(0, 17, 0x251c, Termbox::WHITE, Termbox::DEFAULT)
  Termbox.change_cell(79, 17, 0x2524, Termbox::WHITE, Termbox::DEFAULT)
  Termbox.change_cell(0, 4, 0x251c, Termbox::WHITE, Termbox::DEFAULT)
  Termbox.change_cell(79, 4, 0x2524, Termbox::WHITE, Termbox::DEFAULT)
  for i in 5..16
    Termbox.change_cell(1, i, 0x2588, Termbox::YELLOW, Termbox::YELLOW);
    Termbox.change_cell(78, i, 0x2588, Termbox::YELLOW, Termbox::YELLOW);
  end

  draw_key($key['ESC'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F1'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F2'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F3'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F4'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F5'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F6'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F7'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F8'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F9'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F10'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F11'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['F12'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['PRN'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['SCR'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['BRK'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['LED1'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['LED2'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['LED3'], Termbox::WHITE, Termbox::BLUE)

  draw_key($key['TILDE'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['1'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['2'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['3'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['4'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['5'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['6'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['7'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['8'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['9'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['0'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['MINUS'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['EQUALS'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['BACKSLASH'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['BACKSPACE'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['INS'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['HOM'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['PGU'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_NUMLOCK'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_SLASH'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_STAR'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_MINUS'], Termbox::WHITE, Termbox::BLUE)

  draw_key($key['TAB'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['q'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['w'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['e'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['r'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['t'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['y'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['u'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['i'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['o'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['p'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['LSQB'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['RSQB'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['ENTER'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['DEL'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['END'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['PGD'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_7'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_8'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_9'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_PLUS'], Termbox::WHITE, Termbox::BLUE)

  draw_key($key['CAPS'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['a'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['s'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['d'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['f'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['g'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['h'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['j'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['k'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['l'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['SEMICOLON'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['QUOTE'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_4'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_5'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_6'], Termbox::WHITE, Termbox::BLUE)

  draw_key($key['LSHIFT'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['z'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['x'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['c'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['v'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['b'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['n'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['m'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['COMMA'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['PERIOD'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['SLASH'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['RSHIFT'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['ARROW_UP'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_1'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_2'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_3'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_ENTER'], Termbox::WHITE, Termbox::BLUE)

  draw_key($key['LCTRL'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['LWIN'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['LALT'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['SPACE'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['RCTRL'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['RPROP'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['RWIN'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['RALT'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['ARROW_LEFT'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['ARROW_DOWN'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['ARROW_RIGHT'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_0'], Termbox::WHITE, Termbox::BLUE)
  draw_key($key['K_PERIOD'], Termbox::WHITE, Termbox::BLUE)

  printf_tb(33, 1, Termbox::MAGENTA | Termbox::BOLD, Termbox::DEFAULT, "Keyboard demo!")
  printf_tb(21, 2, Termbox::MAGENTA, Termbox::DEFAULT, "(press CTRL+X and then CTRL+Q to exit)")
  printf_tb(15, 3, Termbox::MAGENTA, Termbox::DEFAULT, "(press CTRL+X and then CTRL+C to change input mode)")

  inputmode = Termbox::select_input_mode(0)
  if (inputmode & Termbox::INPUT_ESC) > 0
    inputmode_str = "TB_INPUT_ESC"
  end
  if (inputmode & Termbox::INPUT_ALT) > 0
    inputmode_str = "TB_INPUT_ALT"
  end

  if (inputmode & Termbox::INPUT_MOUSE) > 0
    inputmode_str = inputmode_str + " | TB_INPUT_MOUSE"
  end

  printf_tb(3, 18, Termbox::WHITE, Termbox::DEFAULT, "Input mode: %s", inputmode_str)
end

def funckeymap(k)
  fcmap = [
    "CTRL+2, CTRL+~",
    "CTRL+A",
    "CTRL+B",
    "CTRL+C",
    "CTRL+D",
    "CTRL+E",
    "CTRL+F",
    "CTRL+G",
    "CTRL+H, BACKSPACE",
    "CTRL+I, TAB",
    "CTRL+J",
    "CTRL+K",
    "CTRL+L",
    "CTRL+M, ENTER",
    "CTRL+N",
    "CTRL+O",
    "CTRL+P",
    "CTRL+Q",
    "CTRL+R",
    "CTRL+S",
    "CTRL+T",
    "CTRL+U",
    "CTRL+V",
    "CTRL+W",
    "CTRL+X",
    "CTRL+Y",
    "CTRL+Z",
    "CTRL+3, ESC, CTRL+[",
    "CTRL+4, CTRL+\\",
    "CTRL+5, CTRL+]",
    "CTRL+6",
    "CTRL+7, CTRL+/, CTRL+_",
    "SPACE"
    ]
  fkmap = [
    "F1",
    "F2",
    "F3",
    "F4",
    "F5",
    "F6",
    "F7",
    "F8",
    "F9",
    "F10",
    "F11",
    "F12",
    "INSERT",
    "DELETE",
    "HOME",
    "END",
    "PGUP",
    "PGDN",
    "ARROW UP",
    "ARROW DOWN",
    "ARROW LEFT",
    "ARROW RIGHT"
    ]
  if k == Termbox::KEY_CTRL_8
    return "CTRL+8, BACKSPACE 2"; # 0x8f
  elsif k >= Termbox::KEY_ARROW_RIGHT && k <= 0xFFFF
    return fkmap[0xFFFF-k]
  elsif k <= Termbox::KEY_SPACE
    return fcmap[k]
  else
    return "UNKNOWN"
  end
end

def pretty_print_resize(ev)
  printf_tb(3, 19, Termbox::WHITE, Termbox::DEFAULT, "Resize event: %d x %d", ev.w, ev.h)
end

$counter = 0
def pretty_print_mouse(ev)
  printf_tb(3, 19, Termbox::WHITE, Termbox::DEFAULT, "Mouse event: %d x %d", ev.x, ev.y)
  case ev.key
  when Termbox::KEY_MOUSE_LEFT
    btn = "MouseLeft: %d"
  when Termbox::KEY_MOUSE_MIDDLE
    btn = "MouseMiddle: %d"
  when Termbox::KEY_MOUSE_RIGHT
    btn = "MouseRight: %d"
  when Termbox::KEY_MOUSE_WHEEL_UP
    btn = "MouseWheelUp: %d"
  when Termbox::KEY_MOUSE_WHEEL_DOWN
    btn = "MouseWheelDown: %d"
  when Termbox::KEY_MOUSE_RELEASE
    btn = "MouseRelease: %d"
  end
  $counter += 1
  printf_tb(43, 19, Termbox::WHITE, Termbox::DEFAULT, "Key: ")
  printf_tb(48, 19, Termbox::YELLOW, Termbox::DEFAULT, btn, $counter)
end

def pretty_print_press(ev)
  buf = Termbox.utf8_unicode_to_char(ev.ch.ord)
  printf_tb(3, 19, Termbox::WHITE , Termbox::DEFAULT, "Key: ")
  printf_tb(8, 19, Termbox::YELLOW, Termbox::DEFAULT, "decimal: %d", ev.key.to_i)
  printf_tb(8, 20, Termbox::GREEN , Termbox::DEFAULT, "hex:     0x%X", ev.key.to_i)
  printf_tb(8, 21, Termbox::CYAN  , Termbox::DEFAULT, "octal:   0%o", ev.key.to_i)
  printf_tb(8, 22, Termbox::RED   , Termbox::DEFAULT, "string:  %s", funckeymap(ev.key))

  printf_tb(54, 19, Termbox::WHITE , Termbox::DEFAULT, "Char: ")
  printf_tb(60, 19, Termbox::YELLOW, Termbox::DEFAULT, "decimal: %d", ev.ch.ord)
  printf_tb(60, 20, Termbox::GREEN , Termbox::DEFAULT, "hex:     0x%X", ev.ch.ord)
  printf_tb(60, 21, Termbox::CYAN  , Termbox::DEFAULT, "octal:   0%o", ev.ch.ord)
  printf_tb(60, 22, Termbox::RED   , Termbox::DEFAULT, "string:  %s", buf);

  printf_tb(54, 18, Termbox::WHITE, Termbox::DEFAULT, "Modifier: %s",
    (ev.mod > 0)? "TB_MOD_ALT" : "none")
end

def dispatch_press(ev)
  if (ev.mod & Termbox::MOD_ALT) > 0
    draw_key($key['LALT'], Termbox::WHITE, Termbox::RED)
    draw_key($key['RALT'], Termbox::WHITE, Termbox::RED)
  end

  k = nil
  if ev.key >= Termbox::KEY_ARROW_RIGHT
    k = $func_combos[0xFFFF-ev.key]
  elsif ev.ch.ord < 128
    if ev.ch.ord == 0 && ev.key < 128
     k = $combos[ev.key]
    else
     k = $combos[ev.ch.ord]
    end
  end
  if k == nil
    return
  end
  k.each do |keys|
    draw_key(keys, Termbox::WHITE, Termbox::RED)
  end
end

def keyboard
  ret = Termbox.init
  if ret < 0
    $stderr.puts "Termbox.init failed with error code #{ret}"
    return 1
  end

  Termbox.select_input_mode(Termbox::INPUT_ESC | Termbox::INPUT_MOUSE)

  Termbox.clear
  draw_keyboard
  Termbox.present
  inputmode = 0
  ctrlxpressed = false
  while ev = Termbox.poll_event
    case ev.type
    when Termbox::EVENT_KEY
      if ev.key == Termbox::KEY_CTRL_Q && ctrlxpressed
        Termbox.shutdown
        return 0
      end
      if ev.key == Termbox::KEY_CTRL_C && ctrlxpressed
        chmap = [
          Termbox::INPUT_ESC | Termbox::INPUT_MOUSE, # 101
          Termbox::INPUT_ALT | Termbox::INPUT_MOUSE, # 110
          Termbox::INPUT_ESC, # 001
          Termbox::INPUT_ALT, # 010
          ]
        inputmode += 1
        if inputmode >= 4
          inputmode = 0
        end
        Termbox.select_input_mode(chmap[inputmode])
      end
      if ev.key == Termbox::KEY_CTRL_X
        ctrlxpressed = true
      else
        ctrlxpressed = false
      end

      Termbox.clear()
      draw_keyboard()
      dispatch_press(ev)
      pretty_print_press(ev)
      Termbox.present()
    when Termbox::EVENT_RESIZE
      Termbox.clear()
      draw_keyboard()
      pretty_print_resize(ev)
      Termbox.present()
    when Termbox::EVENT_MOUSE
      Termbox.clear()
      draw_keyboard()
      pretty_print_mouse(ev)
      Termbox.present()
    end
  end
  Termbox.shutdown
end

keyboard