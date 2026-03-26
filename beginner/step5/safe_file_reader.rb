module SafeFileReader
    module_function

    def read(path)
        File.read(path)
    rescue Errno::ENOENT
        puts "[WARN] ファイルが存在しません： #{path}"
        nil
    rescue Errno::EACCES
        puts "[ERROR] ファイルにアクセスできません: #{path}"
        nil
    end
end