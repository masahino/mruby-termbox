MRuby::Gem::Specification.new('mruby-termbox') do |spec|
  spec.license = 'MIT'
  spec.authors = 'masahino'
  spec.add_dependency 'mruby-string-ext'
  spec.add_dependency 'mruby-numeric-ext'

  spec.linker.libraries << 'termbox'

  def spec.build_termbox
    termbox_url = "https://github.com/nullgemm/termbox_next"
    termbox_build_root = "#{build_dir}/termbox_next"
    termbox_src = "#{termbox_build_root}/src"
    termbox_a = "#{termbox_build_root}/bin/termbox.a"

    FileUtils.mkdir_p build_dir

    if !File.exists? termbox_build_root
      Dir.chdir(build_dir) do
        sh %Q{git clone #{termbox_url}}
      end
    end

    if !File.exists? termbox_a
      Dir.chdir(termbox_build_root) do
        sh %Q{make}
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
