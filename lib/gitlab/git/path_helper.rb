module Gitlab
  module Git
    class PathHelper
      class << self
        def normalize_path(filename)
          # Strip all leading slashes so that //foo -> foo
          filename[/^\/*/] = ''

          # Expand relative paths (e.g. foo/../bar)
          filename = Pathname.new(filename)
          filename.relative_path_from(Pathname.new(''))
        end
      end
    end
  end
end
