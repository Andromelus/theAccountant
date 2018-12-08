require 'singleton'
require_relative 'account_manager'

class Interface
    include Singleton

    def display_separation
        puts "----------------------------------------"
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
            start_account_update
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
        puts "NEED TO DO EXIT AND SABING"
        exit
    end

    def start_account_update
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
            puts "             =>#{data["name"]}<=           " 
            display_separation
            puts "|       Libelle      |      Value      |"
            for i in 1..data.length - 2
                display_separation
                line = ""
                lib_length = data[i.to_s]["libelle"].length
                line+= "| #{data[i.to_s]["libelle"]}"
                for j in lib_length..18
                    line += " "
                end
                line += "| #{data[i.to_s]["value"]}"

                value_length = data[i.to_s]["value"].to_s.length
                for k in value_length..10
                    line += " "
                end
                line += "     |"
                puts line
            end
            display_separation
        else
            puts "Error loading data"
        end
        todo = gets.chomp
    end
end
