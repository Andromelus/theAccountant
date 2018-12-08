require 'singleton'
require_relative 'account_manager'

class Interface
    include Singleton

    def display_separation
        puts "--------------------------------------------------------"
    end

    def clear_term
        system "clear"
    end

    def what_to_do
        clear_term
        display_accounts_name
        puts "Actions"
        display_separation
        puts "| [1] - Update account"
        puts "| [10] - Exit"
        todo = gets.chomp
        do_task(todo)
    end

    private
    def do_task(todo)
        case todo.to_i
        when 1
            chose_account_update
        when 10
            save_and_exit
        else 
            puts "Wrong input"
        end
        what_to_do
    end

    def display_accounts_name
        puts "Your accounts"
        display_separation
        accounts = Accountant.instance.get_accounts_name
        for i in 0..accounts.length - 1
            puts "| #{accounts[i]}"
        end
        display_separation
    end

    def save_and_exit
        clear_term
        puts "Saving ..."
        Accountant.instance.save_current_data
        puts "Successfuly saved new data"
        exit
    end

    def chose_account_update
        clear_term
        accounts = Accountant.instance.get_accounts_name
        puts "Which account do you want to update?"
        for i in 0..accounts.length - 1
            puts "[#{i}] - #{accounts[i]}"
        end
        puts "[10] - Cancel"
        todo = gets.chomp
        if todo.to_i == 10
            return 0
        else
            display_account_log(todo.to_i + 1)
        end
    end

    
    def display_account_log(account_id)
        clear_term
        data =  Accountant.instance.get_account_logs(account_id)
        if data != nil
            puts "             =>#{data["name"]}<= (#{Accountant.instance.calculate_total_in_account(account_id)})          " 
            display_separation
            puts "| ID |       Libelle      |      Value      |   Date   |"
            for i in 1..data["txl"].length 
                display_separation
                line = "| -#{i} "
                lib_length = data["txl"][i.to_s]["libelle"].length
                line+= "| #{data["txl"][i.to_s]["libelle"]}"
                for j in lib_length..18
                    line += " "
                end
                line += "| #{data["txl"][i.to_s]["value"]}"

                value_length = data["txl"][i.to_s]["value"].to_s.length
                for k in value_length..10
                    line += " "
                end

                line += "     |#{data["txl"][i.to_s]["date"]}"

                puts line
            end
            display_separation
        else
            puts "Error loading data"
        end
        display_update_choice(account_id)
    end

    def display_update_choice(account_id)
        puts "Actions"
        display_separation
        puts "| [1] - Add log"
        puts "| [2] - Delete log"
        puts "| [3] - Update log"
        puts "| [10] - Exit"
        todo = gets.chomp
        case todo.to_i
        when 1
            add_log(account_id)
            display_account_log(account_id)
        when 2
            delete_log(account_id)
        when 3
            update_log(account_id)
        end
    end

    def add_log(account_id)
        clear_term
        puts "Libelle => " 
        libelle = gets.chomp
        puts "Value => "
        value = gets.chomp
        puts "Date => "
        date = gets.chomp
        Accountant.instance.add_log(account_id, libelle, value, date)
        display_account_log(account_id)
    end

    def delete_log(account_id)
        clear_term
        puts "Insert ID of the log to delete"
        to_delete = gets.chomp
        Accountant.instance.delete_log(account_id, to_delete)
        display_account_log(account_id)
    end

    def update_log(account_id)
        clear_term

    end

end
