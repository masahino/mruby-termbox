MRuby::Gem::Specification.new('mruby-termbox') do |spec|
  spec.license = 'MIT'
  spec.authors = 'masahino'

  spec.linker.libraries << 'termbox'
end
