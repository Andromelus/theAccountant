class Account_manager

    @@accounts_name
    @@accounts

    def initialize(data)
        puts "Initializing accounts"
        Interface.instance.display_separation
        @@accounts = data
        @@accounts_name = Hash.new(data["acc_qtt"])
        get_accounts_name(data["accounts"],data["acc_qtt"])
    end

    def get_accounts_name(accounts, acc_qtt)
        i = 0
        for i in 0..acc_qtt-1
            @@accounts_name[i] = accounts[(i+1).to_s]["name"]
        end
    end
end
