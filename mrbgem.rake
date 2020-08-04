MRuby::Gem::Specification.new('mruby-termbox') do |spec|
  spec.license = 'MIT'
  spec.authors = 'masahino'
  spec.add_dependency 'mruby-string-ext'
  spec.add_dependency 'mruby-numeric-ext'

  spec.linker.libraries << 'termbox'

  def spec.build_termbox
    termbox_url = "https://github.com/nsf/termbox"
    termbox_build_root = "#{build_dir}/termbox"
    termbox_src = "#{termbox_build_root}/src"
    termbox_a = "#{termbox_build_root}/build/src/libtermbox.a"

    FileUtils.mkdir_p build_dir

    if !File.exists? termbox_build_root
      Dir.chdir(build_dir) do
        sh %Q{git clone #{termbox_url}}
      end
    end

    if !File.exists? termbox_a
      Dir.chdir(termbox_build_root) do
        sh %Q{./waf configure}
        sh %Q{./waf build}
      end
    end

    self.linker.flags_before_libraries << termbox_a
    self.linker.libraries.delete 'termbox'
    [self.cc, self.cxx, self.objc, self.mruby.cc, self.mruby.cxx, self.mruby.objc].each do |cc|
      cc.include_paths << termbox_src
    end

  end

  if build.cc.respond_to? :search_header_path and build.cc.search_header_path 'termbox.h'
    spec.cc.defines += ['HAVE_TERMBOX_H']
    spec.linker.libraries << 'termbox'
  else
    spec.build_termbox
  end
end
