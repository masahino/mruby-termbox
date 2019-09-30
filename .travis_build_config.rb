MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  conf.gem File.expand_path(File.dirname(__FILE__)) do |g|
    g.build_termbox
  end
  conf.enable_test
end
