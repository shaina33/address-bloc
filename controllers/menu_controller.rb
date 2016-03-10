require_relative '../models/address_book'
 
class MenuController
    attr_reader :address_book
 
    def initialize
        @address_book = AddressBook.new
    end
 
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View entry by entry #"
        puts "6 - Exit"
        print "Enter your selection: "
 
        selection = gets.to_i
        
        case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
        when 2
            system "clear"
            create_entry
            main_menu
        when 3
            system "clear"
            search_entries
            main_menu
        when 4
            system "clear"
            read_csv
            main_menu
        when 5
            system "clear"
            view_entry
            main_menu
        when 6
            puts "Good-bye!"
            exit(0)
        else
            system "clear"
            puts "Sorry, that is not a valid input, please try again"
            main_menu
        end
    end
    
    def view_all_entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            entry_submenu(entry)
        end
        system "clear"
        puts "End of entries"
    end
    
    def create_entry
        system "clear"
        puts "New AddressBloc entry"
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone_number, email)
        
        system "clear"
        puts "New entry created successfully"
    end
    
    def view_entry
        if address_book.entries.count > 0
            puts "Enter entry number: "
        else
            puts "No entries exist!"
            main_menu
        end
        index = gets.to_i - 1
        if (index >= 0) && (index < address_book.entries.count)
            system "clear"
            puts "Name: #{address_book.entries[index].name}"
            puts "Phone Number: #{address_book.entries[index].phone_number}"
            puts "Email Address: #{address_book.entries[index].email}"
            view_entry_submenu
        else
            system "clear"
            puts "Sorry, that is not a valid input, please try again"
            view_entry
        end
    end
    
    def view_entry_submenu
        puts "Enter 'v' to view another entry"
        puts "or 'm'  to return to the main menu"
        selection = gets.chomp
        case selection
        when "v"                
            system "clear"
            view_entry
        when "m"
            system "clear"
            main_menu                
        else #catches low numbers and letters
            system "clear"
            puts "Sorry, that is not a valid input, try again."
            view_entry_submenu
        end
    end
    
    def search_entries
    end
    
    def read_csv
    end
    
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
 
        selection = gets.chomp
 
        case selection
        when "n"
        when "d"
        when "e"
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
        end
    end
end