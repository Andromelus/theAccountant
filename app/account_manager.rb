require 'singleton'
class Accountant

    include Singleton
    @@accounts_name
    @@accounts

    def get_accounts_name
        return @@accounts_name
    end

    def init_class(data)
        puts "Initializing accounts"
        Interface.instance.display_separation
        @@accounts = data
        @@accounts_name = Hash.new(data["acc_qtt"])
        store_accounts_name(data["accounts"],data["acc_qtt"])
    end
    

    private 
    def store_accounts_name(accounts, acc_qtt)
        i = 0
        for i in 0..acc_qtt-1
            @@accounts_name[i] = accounts[(i+1).to_s]["name"]
        end
    end
end
