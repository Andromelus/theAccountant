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

    def calculate_total_in_account(account_id)
        if @@data["accounts"][account_id.to_s] == nil
            return "Does not exist"
        else
            total = 0.0
            for i in 1..@@data["accounts"][account_id.to_s]["txl"].length
                total += @@data["accounts"][account_id.to_s]["txl"][i.to_s]["value"].to_f
            end
            return total
        end
    end

    def add_log(account_id, libelle, value, date)
        new_id = @@data["accounts"][account_id.to_s]["txl"].length + 1
        @@data["accounts"][account_id.to_s]["txl"][new_id.to_s] = {"libelle" => libelle, "value" => value.to_f, "date" => date, "validated" => false}
        save_current_data
        return @@data["accounts"][account_id.to_s]["txl"][new_id.to_s]
    end

    def delete_log(account_id, log_id)
        if @@data["accounts"][account_id.to_s] != nil
            if @@data["accounts"][account_id.to_s]["txl"][log_id.to_s] != nil
                @@data["accounts"][account_id.to_s]["txl"].delete(log_id.to_s)
                save_current_data
            end
        else
            puts "ERROR Accountant.delete_log"
            return "not found"     
        end
    end

    def update_log(account_id, new_libelle, new_value, new_date, log_id)
        if @@data["accounts"][account_id.to_s] != nil
            if @@data["accounts"][account_id.to_s]["txl"][log_id.to_s] != nil
                if (new_libelle != "")
                    @@data["accounts"][account_id.to_s]["txl"][log_id.to_s]["libelle"] = new_libelle
                end
                if (new_value != "")
                    @@data["accounts"][account_id.to_s]["txl"][log_id.to_s]["value"] = new_value
                end
                if (new_date != "")
                    @@data["accounts"][account_id.to_s]["txl"][log_id.to_s]["date"] = new_date
                end
                save_current_data
            else
                puts "ERROR Accountant.update"
                return "not found"
            end
        end

    end

    def check_uncheck_log(account_id, log_id)
        if @@data["accounts"][account_id.to_s] != nil
            if @@data["accounts"][account_id.to_s]["txl"][log_id.to_s] != nil
                @@data["accounts"][account_id.to_s]["txl"][log_id.to_s]["validated"] = !@@data["accounts"][account_id.to_s]["txl"][log_id.to_s]["validated"]
            else
                puts "Error Accountant.check_uncheck_log - 1"
                return "ERROR"
            end
        else
            puts "Error Accountant.check_uncheck_log - 2"
            return "ERROR"
        end
        save_current_data
    end
        
    def save_current_data
        DAO.instance.overwrite_file(@@data)
    end
    private 
    def store_accounts_name(accounts, acc_qtt)
        i = 0
        for i in 0..acc_qtt-1
            @@accounts_name[i] = accounts[(i+1).to_s]["name"]
        end
    end


end
