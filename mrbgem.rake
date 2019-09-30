MRuby::Gem::Specification.new('mruby-termbox') do |spec|
  spec.license = 'MIT'
  spec.authors = 'masahino'

  spec.linker.libraries << 'termbox'

  def spec.build_termbox
    termbox_url = "https://github.com/nsf/termbox"
    termbox_build_root = "#{build_dir}/termbox"
    termbox_src = "#{termbox_build_root}/src"
    termbox_a = "#{termbox_build_root}/build/src/libtermbox.a"

    unless File.exists?(termbox_a)
      sh %Q{(cd #{build_dir}; git clone #{termbox_url})}
      sh %Q{(cd #{termbox_build_root}; ./waf configure)}
      sh %Q{(cd #{termbox_build_root}; ./waf build)}
    end
    self.linker.flags_before_libraries << termbox_a
    self.linker.libraries.delete 'termbox'
    [self.cc, self.cxx, self.objc, self.mruby.cc, self.mruby.cxx, self.mruby.objc].each do |cc|
      cc.include_paths << termbox_src
    end
  end
end
