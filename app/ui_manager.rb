require 'singleton'
require_relative 'account_manager'

class Interface
    include Singleton

    def display_separation
        puts "----------------------------"
    end

    def what_to_do
        puts "[1] - List your accounts"
        puts "[2] - Update account"
        puts "[10] - Exit"
        todo = gets.chomp
        do_task(todo)
    end

    def display_vertical_separation(number)
        for i in 1..number
            puts 
        end
    end

    private
    def do_task(todo)
        case todo.to_i
        when 1
            display_accounts_name
        when 2
            start_account_update
        when 10
            save_and_exit
        else 
            puts "Wrong input"
        end
        what_to_do
    end

    def display_accounts_name
        display_vertical_separation(2)
        display_separation
        accounts = Accountant.instance.get_accounts_name
        line = ""
        for i in 0..accounts.length - 1
            if i == 0
                line += "  #{accounts[i]}"
            else
                line += " | #{accounts[i]}"
            end
        end
        puts line
        display_separation
        display_vertical_separation(2)
    end

    def save_and_exit
        puts "Saving ..."
        puts "NEED TO DO EXIT AND SABING"
        exit
    end

    def start_account_update
        display_vertical_separation(2)
        display_separation
        accounts = Accountant.instance.get_accounts_name
        puts "Which account do you want to update?"
        for i in 0..accounts.length - 1
            puts "[#{i}] - #{accounts[i]}"
        end
        todo = gets.chomp
        display_separation
        display_vertical_separation(2)
    end
    
end
