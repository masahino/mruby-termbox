MRuby::Gem::Specification.new('mruby-termbox') do |spec|
  spec.license = 'MIT'
  spec.authors = 'masahino'
  spec.add_dependency 'mruby-string-ext'
  spec.add_dependency 'mruby-numeric-ext'

  spec.cc.defines << '_XOPEN_SOURCE'
  spec.linker.libraries << 'termbox'

  def spec.build_termbox
    termbox_url = 'https://github.com/masahino/termbox_next'
    termbox_build_root = "#{build_dir}/termbox_next"
    termbox_src = "#{termbox_build_root}/src"
    termbox_a = "#{termbox_build_root}/bin/termbox.a"

    FileUtils.mkdir_p build_dir

    if !File.exist? termbox_build_root
      Dir.chdir(build_dir) do
        sh %(git clone #{termbox_url})
      end
    end

    if !File.exist? termbox_a
      Dir.chdir(termbox_build_root) do
        if RUBY_PLATFORM.downcase =~ /msys|mingw|cygwin/
          sh %(make FLAGS="-D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE")
        else
          sh %(make)
        end
      end
    end

    linker.flags_before_libraries << termbox_a
    linker.libraries.delete 'termbox'
    [cc, cxx, objc, mruby.cc, mruby.cxx, mruby.objc].each do |cc|
      cc.include_paths << termbox_src
    end
  end

  spec.build_termbox
end
