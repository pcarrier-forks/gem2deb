require 'test_helper'
require 'gem2deb/extension_builder'

class ExtensionBuilderTest < Gem2DebTestCase

  gem = SIMPLE_EXTENSION_WITH_NAME_CLASH_NAME
  build_dir = 'ruby-' + SIMPLE_EXTENSION_WITH_NAME_CLASH_DIRNAME
  target_dir = File.join(tmpdir, build_dir)
  package = 'ruby-' + SIMPLE_EXTENSION_WITH_NAME_CLASH_NAME.gsub('_', '-')

  one_time_setup do
    FileUtils.cp_r(File.join('test/sample/', gem), target_dir)
    Dir.chdir(target_dir) do
      silence_stream STDOUT do
        Gem2Deb::ExtensionBuilder.build_all_extensions(package)
      end
    end
  end

  context 'building simpleextension' do
    should 'install .so for current Ruby' do
      Dir.chdir(target_dir) do
        assert_file_exists File.join('debian', package, RbConfig::CONFIG['vendorarchdir'] + '/simpleextension_with_name_clash.so')
      end
    end
  end

end
