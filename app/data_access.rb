require 'json'
require 'singleton'
class DAO

    include Singleton
    @@file_path = "./data/data.json"

    def merge_hashes_to_json(hash1, hash2)
        final_hash = hash1.merge(hash2)
        return final_hash.to_json
    end

    def data_file_to_hash
        return JSON.parse(File.read(@@file_path))
    end

    def overwrite_file(data)
        File.write(@@file_path, data.to_json)
    end
end
