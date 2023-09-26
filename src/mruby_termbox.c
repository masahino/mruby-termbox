#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include <mruby.h>
#include <mruby/array.h>
#include <mruby/class.h>
#include <mruby/data.h>
#include <mruby/string.h>
#include <termbox.h>

const static struct mrb_data_type mrb_termbox_event_data_type = { "Termbox::Event", mrb_free };
const static struct mrb_data_type mrb_termbox_cell_data_type = { "Termbox::Cell", mrb_free};

mrb_value
mrb_termbox_init(mrb_state *mrb, mrb_value self)
{
  int ret;
  ret = tb_init();
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_init_file(mrb_state *mrb, mrb_value self)
{
  int ret;
  const char *fname = NULL;

  mrb_get_args(mrb, "z", &fname);
  ret = tb_init_file(fname);
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_shutdown(mrb_state *mrb, mrb_value self)
{
  tb_shutdown();
  return mrb_nil_value();
}

mrb_value
mrb_termbox_width(mrb_state *mrb, mrb_value self)
{
  int ret;

  ret = tb_width();
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_height(mrb_state *mrb, mrb_value self)
{
  int ret;

  ret = tb_height();
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_clear(mrb_state *mrb, mrb_value self)
{
  tb_clear();
  return mrb_nil_value();
}

mrb_value
mrb_termbox_set_clear_attributes(mrb_state *mrb, mrb_value self)
{
  mrb_int fg, bg;
  mrb_get_args(mrb, "ii", &fg, &bg);
  tb_set_clear_attributes(fg, bg);
  return mrb_nil_value();
}

mrb_value
mrb_termbox_present(mrb_state *mrb, mrb_value self)
{
  tb_present();
  return mrb_nil_value();
}

mrb_value
mrb_termbox_set_cursor(mrb_state *mrb, mrb_value self)
{
  mrb_int cx, cy;
  mrb_get_args(mrb, "ii", &cx, &cy);
  tb_set_cursor(cx, cy);
  return mrb_nil_value();
}

mrb_value
mrb_termbox_put_cell(mrb_state *mrb, mrb_value self)
{
  mrb_raise(mrb, E_NOTIMP_ERROR, "not yet implemented");
  return mrb_nil_value();
}

mrb_value
mrb_termbox_change_cell(mrb_state *mrb, mrb_value self)
{
  mrb_value str, ch;
  mrb_int x, y, fg, bg;
  mrb_get_args(mrb, "iioii", &x, &y, &str, &fg, &bg);
  switch(mrb_type(str)) {
    case MRB_TT_FIXNUM:
    ch = str;
    break;
    case MRB_TT_STRING:
    ch = mrb_funcall(mrb, str, "ord", 0);
    break;
    default:
    mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid parameter");
  }
  tb_change_cell(x, y, mrb_fixnum(ch), fg, bg);
  return mrb_nil_value();
}

mrb_value
mrb_termbox_blit(mrb_state *mrb, mrb_value self)
{
  mrb_raise(mrb, E_NOTIMP_ERROR, "not yet implemented");
  return mrb_nil_value();
}

mrb_value
mrb_termbox_cell_buffer(mrb_state *mrb, mrb_value self)
{
  mrb_raise(mrb, E_NOTIMP_ERROR, "not yet implemented");
  return mrb_nil_value();
}

mrb_value
mrb_termbox_set_cell_buffer(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell_buffer, *ptr, *cell;
  mrb_int len, i;
  mrb_value buf;
  mrb_get_args(mrb, "A", &buf);

  cell_buffer = tb_cell_buffer();
  ptr = cell_buffer;
  len = RARRAY_LEN(buf);
  for (i = 0; i < len; i++) {
    cell = (struct tb_cell *)DATA_PTR(mrb_ary_ref(mrb, buf, i));
    memcpy(ptr, cell, sizeof(struct tb_cell));
    ptr++;
  }
  return mrb_nil_value();
}

mrb_value
mrb_termbox_select_input_mode(mrb_state *mrb, mrb_value self)
{
  mrb_int mode;
  int ret;
  mrb_get_args(mrb, "i", &mode);
  ret = tb_select_input_mode(mode);
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_select_output_mode(mrb_state *mrb, mrb_value self)
{
  mrb_int mode;
  int ret;
  mrb_get_args(mrb, "i", &mode);
  ret = tb_select_output_mode(mode);
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_peek_event(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)mrb_malloc(mrb, sizeof(struct tb_event));;
  struct RClass *event_class = mrb_class_get_under(mrb, mrb_module_get(mrb, "Termbox"), "Event");
  mrb_value event_obj = mrb_obj_value(Data_Wrap_Struct(mrb, event_class, &mrb_termbox_event_data_type, NULL));
  mrb_int timeout;
  int ret = 0;
  mrb_get_args(mrb, "i", &timeout);
  ret = tb_peek_event(event, timeout);
  if (ret == 0) {
    return mrb_nil_value();
  }
  if (ret < 0) {
    return mrb_fixnum_value(ret);
  }
  DATA_TYPE(event_obj) = &mrb_termbox_event_data_type;
  DATA_PTR(event_obj) = event;
  return event_obj;
}

mrb_value
mrb_termbox_poll_event(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)mrb_malloc(mrb, sizeof(struct tb_event));;
  struct RClass *event_class = mrb_class_get_under(mrb, mrb_module_get(mrb, "Termbox"), "Event");
  mrb_value event_obj = mrb_obj_value(Data_Wrap_Struct(mrb, event_class, &mrb_termbox_event_data_type, NULL));
  int ret;

  ret = tb_poll_event(event);
  if (ret < 0) {
    return mrb_nil_value();
  }
  DATA_TYPE(event_obj) = &mrb_termbox_event_data_type;
  DATA_PTR(event_obj) = event;
  return event_obj;
}

mrb_value
mrb_termbox_utf8_char_length(mrb_state *mrb, mrb_value self)
{
  char *c;
  mrb_int ret;

  mrb_get_args(mrb, "z", &c);
  ret = utf8_char_length(c[0]);
  return mrb_fixnum_value(ret);
}

mrb_value
mrb_termbox_utf8_char_to_unicode(mrb_state *mrb, mrb_value self)
{
  char *c;
  uint32_t out;
  mrb_int ret;
  mrb_get_args(mrb, "z", &c);
  ret = utf8_char_to_unicode(&out, c);
  return mrb_fixnum_value(out);
}

mrb_value
mrb_termbox_utf8_unicode_to_char(mrb_state *mrb, mrb_value self)
{
  mrb_int c;
  char out[8];
  int ret;
  mrb_get_args(mrb, "i", &c);
  ret = utf8_unicode_to_char(out, c);
  return mrb_str_new_cstr(mrb, out);
}

mrb_value
mrb_termbox_event_type(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->type);
}

mrb_value
mrb_termbox_event_mod(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->mod);
}

mrb_value
mrb_termbox_event_key(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->key);
}

mrb_value
mrb_termbox_event_ch(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  mrb_value ch = mrb_fixnum_value(event->ch);
#ifdef MRB_UTF8_STRING
  return mrb_funcall(mrb, ch, "chr", 1, mrb_str_new_cstr(mrb, "UTF-8"));
#else
  return mrb_funcall(mrb, ch, "chr", 0);
#endif
}

mrb_value
mrb_termbox_event_w(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->w);
}

mrb_value
mrb_termbox_event_h(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->h);
}

mrb_value
mrb_termbox_event_x(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->x);
}

mrb_value
mrb_termbox_event_y(mrb_state *mrb, mrb_value self)
{
  struct tb_event *event = (struct tb_event *)DATA_PTR(self);
  return mrb_fixnum_value(event->y);
}

mrb_value
mrb_termbox_cell_init(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell;
  mrb_int argc;
  mrb_value str, ch;
  mrb_int fg, bg;

  cell = mrb_malloc(mrb, sizeof(struct tb_cell));
  cell->ch = 0;
  cell->fg = 0;
  cell->bg = 0;

  argc = mrb_get_args(mrb, "|oii", &str, &fg, &bg);
  if (argc > 0) {
    switch(mrb_type(str)) {
      case MRB_TT_FIXNUM:
      ch = str;
      break;
      case MRB_TT_STRING:
      ch = mrb_funcall(mrb, str, "ord", 0);
      break;
      default:
      mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid parameter");
    }
    cell->ch = mrb_fixnum(ch);
  }
  if (argc > 1) {
    cell->fg = fg;
  }
  if (argc > 2) {
    cell->bg = bg;
  }
  DATA_TYPE(self) = &mrb_termbox_cell_data_type;
  DATA_PTR(self) = cell;

  return self;
}

mrb_value
mrb_termbox_cell_ch(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell = (struct tb_cell *)DATA_PTR(self);
  mrb_value ch = mrb_fixnum_value(cell->ch);
#ifdef MRB_UTF8_STRING
  return mrb_funcall(mrb, ch, "chr", 1, mrb_str_new_cstr(mrb, "UTF-8"));
#else
  return mrb_funcall(mrb, ch, "chr", 0);
#endif
}

mrb_value
mrb_termbox_cell_set_ch(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell = (struct tb_cell *)DATA_PTR(self);
  mrb_value str, ch;
  mrb_get_args(mrb, "o", &str);

  switch(mrb_type(str)) {
    case MRB_TT_FIXNUM:
    ch = str;
    break;
    case MRB_TT_STRING:
    ch = mrb_funcall(mrb, str, "ord", 0);
    break;
    default:
    mrb_raise(mrb, E_ARGUMENT_ERROR, "invalid parameter");
  }
  cell->ch = mrb_fixnum(ch);
  return mrb_nil_value();
}

mrb_value
mrb_termbox_cell_fg(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell = (struct tb_cell *)DATA_PTR(self);
  return mrb_fixnum_value(cell->fg);
}

mrb_value
mrb_termbox_cell_set_fg(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell = (struct tb_cell *)DATA_PTR(self);
  mrb_int fg;
  mrb_get_args(mrb, "i", &fg);
  cell->fg = fg;
  return mrb_nil_value();
}

mrb_value
mrb_termbox_cell_bg(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell = (struct tb_cell *)DATA_PTR(self);
  return mrb_fixnum_value(cell->bg);
}

mrb_value
mrb_termbox_cell_set_bg(mrb_state *mrb, mrb_value self)
{
  struct tb_cell *cell = (struct tb_cell *)DATA_PTR(self);
  mrb_int bg;
  mrb_get_args(mrb, "i", &bg);
  cell->bg = bg;
  return mrb_nil_value();
}

#ifdef MRB_UTF8_STRING
int
mrb_utf8_display_width(const char *s) {
  wchar_t wch;
  if (mbtowc(&wch, s, MB_CUR_MAX) < 1) return 1;
  int width = wcwidth(wch);
  return width >= 0 ? width : 1;
}
#endif

mrb_value
mrb_termbox_draw_text(mrb_state *mrb, mrb_value self)
{
  mrb_value str;
  mrb_int x, y, fg, bg, len;
  char *p, *e;

  mrb_get_args(mrb, "iiSii", &x, &y, &str, &fg, &bg);

  p = RSTRING_PTR(str);
  len = RSTRING_LEN(str);
  e = p + len;

  while (p < e) {
#ifdef MRB_UTF8_STRING
    uint32_t c;
    utf8_char_to_unicode(&c, p);
    tb_change_cell(x, y, c, fg, bg);
    mrb_int ulen = utf8_char_length(*p);
    x += mrb_utf8_display_width(p);
    len -= ulen;
    p += ulen;
#else
    tb_change_cell(x, y, (uint32_t)*p, fg, bg);
    x++;
    p++;
#endif
  }
  return mrb_nil_value();
}


void
mrb_mruby_termbox_gem_init(mrb_state *mrb)
{
  struct RClass *termbox_module, *termbox_event, *termbox_cell;

  termbox_module = mrb_define_module(mrb, "Termbox");
  termbox_event = mrb_define_class_under(mrb, termbox_module, "Event", mrb->object_class);
  MRB_SET_INSTANCE_TT(termbox_event, MRB_TT_DATA);
  termbox_cell = mrb_define_class_under(mrb, termbox_module, "Cell", mrb->object_class);
  MRB_SET_INSTANCE_TT(termbox_cell, MRB_TT_DATA);

  mrb_define_const(mrb, termbox_module, "MOD_ALT", mrb_fixnum_value(TB_MOD_ALT));
  mrb_define_const(mrb, termbox_module, "MOD_MOTION", mrb_fixnum_value(TB_MOD_MOTION));

  mrb_define_const(mrb, termbox_module, "DEFAULT", mrb_fixnum_value(TB_DEFAULT));
  mrb_define_const(mrb, termbox_module, "BLACK", mrb_fixnum_value(TB_BLACK));
  mrb_define_const(mrb, termbox_module, "RED", mrb_fixnum_value(TB_RED));
  mrb_define_const(mrb, termbox_module, "GREEN", mrb_fixnum_value(TB_GREEN));
  mrb_define_const(mrb, termbox_module, "YELLOW", mrb_fixnum_value(TB_YELLOW));
  mrb_define_const(mrb, termbox_module, "BLUE", mrb_fixnum_value(TB_BLUE));
  mrb_define_const(mrb, termbox_module, "MAGENTA", mrb_fixnum_value(TB_MAGENTA));
  mrb_define_const(mrb, termbox_module, "CYAN", mrb_fixnum_value(TB_CYAN));
  mrb_define_const(mrb, termbox_module, "WHITE", mrb_fixnum_value(TB_WHITE));

  mrb_define_const(mrb, termbox_module, "BOLD", mrb_fixnum_value(TB_BOLD));
  mrb_define_const(mrb, termbox_module, "UNDERLINE", mrb_fixnum_value(TB_UNDERLINE));
  mrb_define_const(mrb, termbox_module, "REVERSE", mrb_fixnum_value(TB_REVERSE));
#ifdef TB_ITALIC
  mrb_define_const(mrb, termbox_module, "ITALIC", mrb_fixnum_value(TB_ITALIC));
#endif

  mrb_define_class_method(mrb, termbox_module, "init", mrb_termbox_init, MRB_ARGS_NONE());
  mrb_define_class_method(mrb, termbox_module, "init_file", mrb_termbox_init_file, MRB_ARGS_REQ(1));
  mrb_define_class_method(mrb, termbox_module, "shutdown", mrb_termbox_shutdown, MRB_ARGS_NONE());

  mrb_define_class_method(mrb, termbox_module, "width", mrb_termbox_width, MRB_ARGS_NONE());
  mrb_define_class_method(mrb, termbox_module, "height", mrb_termbox_height, MRB_ARGS_NONE());

  mrb_define_class_method(mrb, termbox_module, "clear", mrb_termbox_clear, MRB_ARGS_NONE());
  mrb_define_class_method(mrb, termbox_module, "set_clear_attributes", mrb_termbox_set_clear_attributes,
    MRB_ARGS_REQ(2));

  mrb_define_class_method(mrb, termbox_module, "present", mrb_termbox_present, MRB_ARGS_NONE());

  mrb_define_const(mrb, termbox_module, "HIDE_CURSOR", mrb_fixnum_value(TB_HIDE_CURSOR));
  mrb_define_class_method(mrb, termbox_module, "set_cursor", mrb_termbox_set_cursor,
    MRB_ARGS_REQ(2));

  mrb_define_class_method(mrb, termbox_module, "put_cell", mrb_termbox_put_cell,
    MRB_ARGS_REQ(2));
  mrb_define_class_method(mrb, termbox_module, "change_cell", mrb_termbox_change_cell,
    MRB_ARGS_REQ(4));

  mrb_define_class_method(mrb, termbox_module, "blit", mrb_termbox_blit, MRB_ARGS_REQ(5));

  mrb_define_class_method(mrb, termbox_module, "cell_buffer", mrb_termbox_cell_buffer, MRB_ARGS_NONE());
  mrb_define_class_method(mrb, termbox_module, "set_cell_buffer", mrb_termbox_set_cell_buffer, MRB_ARGS_REQ(1));

  mrb_define_const(mrb, termbox_module, "INPUT_CURRENT", mrb_fixnum_value(TB_INPUT_CURRENT));
  mrb_define_const(mrb, termbox_module, "INPUT_ESC", mrb_fixnum_value(TB_INPUT_ESC));
  mrb_define_const(mrb, termbox_module, "INPUT_ALT", mrb_fixnum_value(TB_INPUT_ALT));
  mrb_define_const(mrb, termbox_module, "INPUT_MOUSE", mrb_fixnum_value(TB_INPUT_MOUSE));

  mrb_define_class_method(mrb, termbox_module, "select_input_mode", mrb_termbox_select_input_mode,
    MRB_ARGS_REQ(1));

  mrb_define_const(mrb, termbox_module, "OUTPUT_CURRENT", mrb_fixnum_value(TB_OUTPUT_CURRENT));
  mrb_define_const(mrb, termbox_module, "OUTPUT_NORMAL", mrb_fixnum_value(TB_OUTPUT_NORMAL));
  mrb_define_const(mrb, termbox_module, "OUTPUT_256", mrb_fixnum_value(TB_OUTPUT_256));
  mrb_define_const(mrb, termbox_module, "OUTPUT_216", mrb_fixnum_value(TB_OUTPUT_216));
  mrb_define_const(mrb, termbox_module, "OUTPUT_GRAYSCALE", mrb_fixnum_value(TB_OUTPUT_GRAYSCALE));
  mrb_define_const(mrb, termbox_module, "OUTPUT_TRUECOLOR", mrb_fixnum_value(TB_OUTPUT_TRUECOLOR));

  mrb_define_class_method(mrb, termbox_module, "select_output_mode", mrb_termbox_select_output_mode,
    MRB_ARGS_REQ(1));

  mrb_define_class_method(mrb, termbox_module, "peek_event", mrb_termbox_peek_event, MRB_ARGS_REQ(1));
  mrb_define_class_method(mrb, termbox_module, "poll_event", mrb_termbox_poll_event, MRB_ARGS_NONE());

  mrb_define_class_method(mrb, termbox_module, "utf8_char_length",
    mrb_termbox_utf8_char_length, MRB_ARGS_REQ(1));
  mrb_define_class_method(mrb, termbox_module, "utf8_char_to_unicode",
    mrb_termbox_utf8_char_to_unicode, MRB_ARGS_REQ(1));
  mrb_define_class_method(mrb, termbox_module, "utf8_unicode_to_char",
    mrb_termbox_utf8_unicode_to_char, MRB_ARGS_REQ(1));

  mrb_define_const(mrb, termbox_module, "EVENT_KEY", mrb_fixnum_value(TB_EVENT_KEY));
  mrb_define_const(mrb, termbox_module, "EVENT_RESIZE", mrb_fixnum_value(TB_EVENT_RESIZE));
  mrb_define_const(mrb, termbox_module, "EVENT_MOUSE", mrb_fixnum_value(TB_EVENT_MOUSE));

  mrb_define_method(mrb, termbox_event, "type", mrb_termbox_event_type, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "mod", mrb_termbox_event_mod, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "key", mrb_termbox_event_key, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "ch", mrb_termbox_event_ch, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "w", mrb_termbox_event_w, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "h", mrb_termbox_event_h, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "x", mrb_termbox_event_x, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_event, "y", mrb_termbox_event_y, MRB_ARGS_NONE());

  mrb_define_const(mrb, termbox_module, "KEY_F1", mrb_fixnum_value(TB_KEY_F1));
  mrb_define_const(mrb, termbox_module, "KEY_F2", mrb_fixnum_value(TB_KEY_F2));
  mrb_define_const(mrb, termbox_module, "KEY_F3", mrb_fixnum_value(TB_KEY_F3));
  mrb_define_const(mrb, termbox_module, "KEY_F4", mrb_fixnum_value(TB_KEY_F4));
  mrb_define_const(mrb, termbox_module, "KEY_F5", mrb_fixnum_value(TB_KEY_F5));
  mrb_define_const(mrb, termbox_module, "KEY_F6", mrb_fixnum_value(TB_KEY_F6));
  mrb_define_const(mrb, termbox_module, "KEY_F7", mrb_fixnum_value(TB_KEY_F7));
  mrb_define_const(mrb, termbox_module, "KEY_F8", mrb_fixnum_value(TB_KEY_F8));
  mrb_define_const(mrb, termbox_module, "KEY_F9", mrb_fixnum_value(TB_KEY_F9));
  mrb_define_const(mrb, termbox_module, "KEY_F10", mrb_fixnum_value(TB_KEY_F10));
  mrb_define_const(mrb, termbox_module, "KEY_F11", mrb_fixnum_value(TB_KEY_F11));
  mrb_define_const(mrb, termbox_module, "KEY_F12", mrb_fixnum_value(TB_KEY_F12));
  mrb_define_const(mrb, termbox_module, "KEY_INSERT", mrb_fixnum_value(TB_KEY_INSERT));
  mrb_define_const(mrb, termbox_module, "KEY_DELETE", mrb_fixnum_value(TB_KEY_DELETE));
  mrb_define_const(mrb, termbox_module, "KEY_HOME", mrb_fixnum_value(TB_KEY_HOME));
  mrb_define_const(mrb, termbox_module, "KEY_END", mrb_fixnum_value(TB_KEY_END));
  mrb_define_const(mrb, termbox_module, "KEY_PGUP", mrb_fixnum_value(TB_KEY_PGUP));
  mrb_define_const(mrb, termbox_module, "KEY_PGDN", mrb_fixnum_value(TB_KEY_PGDN));
  mrb_define_const(mrb, termbox_module, "KEY_ARROW_UP", mrb_fixnum_value(TB_KEY_ARROW_UP));
  mrb_define_const(mrb, termbox_module, "KEY_ARROW_DOWN", mrb_fixnum_value(TB_KEY_ARROW_DOWN));
  mrb_define_const(mrb, termbox_module, "KEY_ARROW_LEFT", mrb_fixnum_value(TB_KEY_ARROW_LEFT));
  mrb_define_const(mrb, termbox_module, "KEY_ARROW_RIGHT", mrb_fixnum_value(TB_KEY_ARROW_RIGHT));
  mrb_define_const(mrb, termbox_module, "KEY_MOUSE_LEFT", mrb_fixnum_value(TB_KEY_MOUSE_LEFT));
  mrb_define_const(mrb, termbox_module, "KEY_MOUSE_RIGHT", mrb_fixnum_value(TB_KEY_MOUSE_RIGHT));
  mrb_define_const(mrb, termbox_module, "KEY_MOUSE_MIDDLE", mrb_fixnum_value(TB_KEY_MOUSE_MIDDLE));
  mrb_define_const(mrb, termbox_module, "KEY_MOUSE_RELEASE", mrb_fixnum_value(TB_KEY_MOUSE_RELEASE));
  mrb_define_const(mrb, termbox_module, "KEY_MOUSE_WHEEL_UP", mrb_fixnum_value(TB_KEY_MOUSE_WHEEL_UP));
  mrb_define_const(mrb, termbox_module, "KEY_MOUSE_WHEEL_DOWN", mrb_fixnum_value(TB_KEY_MOUSE_WHEEL_DOWN));

  mrb_define_const(mrb, termbox_module, "KEY_CTRL_TILDE", mrb_fixnum_value(TB_KEY_CTRL_TILDE));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_2", mrb_fixnum_value(TB_KEY_CTRL_2));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_A", mrb_fixnum_value(TB_KEY_CTRL_A));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_B", mrb_fixnum_value(TB_KEY_CTRL_B));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_C", mrb_fixnum_value(TB_KEY_CTRL_C));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_D", mrb_fixnum_value(TB_KEY_CTRL_D));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_E", mrb_fixnum_value(TB_KEY_CTRL_E));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_F", mrb_fixnum_value(TB_KEY_CTRL_F));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_G", mrb_fixnum_value(TB_KEY_CTRL_G));
  mrb_define_const(mrb, termbox_module, "KEY_BACKSPACE", mrb_fixnum_value(TB_KEY_BACKSPACE));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_H", mrb_fixnum_value(TB_KEY_CTRL_H));
  mrb_define_const(mrb, termbox_module, "KEY_TAB", mrb_fixnum_value(TB_KEY_TAB));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_I", mrb_fixnum_value(TB_KEY_CTRL_I));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_J", mrb_fixnum_value(TB_KEY_CTRL_J));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_K", mrb_fixnum_value(TB_KEY_CTRL_K));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_L", mrb_fixnum_value(TB_KEY_CTRL_L));
  mrb_define_const(mrb, termbox_module, "KEY_ENTER", mrb_fixnum_value(TB_KEY_ENTER));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_M", mrb_fixnum_value(TB_KEY_CTRL_M));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_N", mrb_fixnum_value(TB_KEY_CTRL_N));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_O", mrb_fixnum_value(TB_KEY_CTRL_O));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_P", mrb_fixnum_value(TB_KEY_CTRL_P));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_Q", mrb_fixnum_value(TB_KEY_CTRL_Q));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_R", mrb_fixnum_value(TB_KEY_CTRL_R));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_S", mrb_fixnum_value(TB_KEY_CTRL_S));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_T", mrb_fixnum_value(TB_KEY_CTRL_T));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_U", mrb_fixnum_value(TB_KEY_CTRL_U));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_V", mrb_fixnum_value(TB_KEY_CTRL_V));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_W", mrb_fixnum_value(TB_KEY_CTRL_W));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_X", mrb_fixnum_value(TB_KEY_CTRL_X));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_Y", mrb_fixnum_value(TB_KEY_CTRL_Y));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_Z", mrb_fixnum_value(TB_KEY_CTRL_Z));
  mrb_define_const(mrb, termbox_module, "KEY_ESC", mrb_fixnum_value(TB_KEY_ESC));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_LSQ_BRACKET", mrb_fixnum_value(TB_KEY_CTRL_LSQ_BRACKET));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_3", mrb_fixnum_value(TB_KEY_CTRL_3));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_4", mrb_fixnum_value(TB_KEY_CTRL_4));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_BACKSLASH", mrb_fixnum_value(TB_KEY_CTRL_BACKSLASH));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_5", mrb_fixnum_value(TB_KEY_CTRL_5));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_RSQ_BRACKET", mrb_fixnum_value(TB_KEY_CTRL_RSQ_BRACKET));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_6", mrb_fixnum_value(TB_KEY_CTRL_6));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_7", mrb_fixnum_value(TB_KEY_CTRL_7));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_SLASH", mrb_fixnum_value(TB_KEY_CTRL_SLASH));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_UNDERSCORE", mrb_fixnum_value(TB_KEY_CTRL_UNDERSCORE));
  mrb_define_const(mrb, termbox_module, "KEY_SPACE", mrb_fixnum_value(TB_KEY_SPACE));
  mrb_define_const(mrb, termbox_module, "KEY_BACKSPACE2", mrb_fixnum_value(TB_KEY_BACKSPACE2));
  mrb_define_const(mrb, termbox_module, "KEY_CTRL_8", mrb_fixnum_value(TB_KEY_CTRL_8));

  mrb_define_method(mrb, termbox_cell, "initialize", mrb_termbox_cell_init, MRB_ARGS_OPT(3));
  mrb_define_method(mrb, termbox_cell, "ch", mrb_termbox_cell_ch, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_cell, "fg", mrb_termbox_cell_fg, MRB_ARGS_NONE());
  mrb_define_method(mrb, termbox_cell, "bg", mrb_termbox_cell_bg, MRB_ARGS_NONE());

  mrb_define_method(mrb, termbox_cell, "ch=", mrb_termbox_cell_set_ch, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, termbox_cell, "fg=", mrb_termbox_cell_set_fg, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, termbox_cell, "bg=", mrb_termbox_cell_set_bg, MRB_ARGS_REQ(1));

  /* additional methods */
  mrb_define_class_method(mrb, termbox_module, "draw_text", mrb_termbox_draw_text, MRB_ARGS_REQ(5));
}

void
mrb_mruby_termbox_gem_final(mrb_state* mrb) {
}