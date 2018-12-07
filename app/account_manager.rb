require 'singleton'
require_relative 'data_access'
class Accountant

    include Singleton
    @@accounts_name
    @@data

    def get_accounts_name
        return @@accounts_name
    end

    def init_class(data)
        puts "Initializing accounts"
        Interface.instance.display_separation
        @@data = data
        @@accounts_name = Hash.new(data["acc_qtt"])
        store_accounts_name(data["accounts"],data["acc_qtt"])
    end

    def get_account_logs(account_id)
        if @@data["accounts"][account_id.to_s] == nil
            return "Does not exist"
        else
            return @@data["accounts"][account_id.to_s]
        end
    end
    

    private 
    def store_accounts_name(accounts, acc_qtt)
        i = 0
        for i in 0..acc_qtt-1
            @@accounts_name[i] = accounts[(i+1).to_s]["name"]
        end
    end

    def save_current_data
        DAO.instance.overwrite_file(@@accounts)
    end
end
