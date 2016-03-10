require_relative '../models/address_book'

RSpec.describe AddressBook do
    let (:book) {AddressBook.new}
    def check_entry(entry, expected_name, expected_number, expected_email)
      expect(entry.name).to eq expected_name
      expect(entry.phone_number).to eq expected_number
      expect(entry.email).to eq expected_email
    end

    
    describe "attributes" do
      it "responds to entries" do
        expect(book).to respond_to(:entries)
      end
      it "initializes entries as an array" do
        expect(book.entries).to be_an(Array)
      end
      it "initializes entries as empty" do
        expect(book.entries.size).to eq(0)
      end
    end
    describe "#add_entry" do
      it "adds only one entry to the address book" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
        expect(book.entries.size).to eq(1)
      end
 
      it "adds the correct information to entries" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        new_entry = book.entries[0]
 
        expect(new_entry.name).to eq('Ada Lovelace')
        expect(new_entry.phone_number).to eq('010.012.1815')
        expect(new_entry.email).to eq('augusta.king@lovelace.com')
      end
    end
    
    describe "#remove_entry" do
      it "removes only one entry from the address book" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')
        book.remove_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')
 
        expect(book.entries.size).to eq(1)
      end
 
      it "removes the correct information from entries" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')
        book.add_entry('Final Entry Name', '222.333.4444', 'test@gmail.com')
        book.remove_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')

        expect(book.entries.any?{|entry| entry.name == 'Shaina Karasin'}).to eq(false)
        expect(book.entries.any?{|entry| entry.name == 'Ada Lovelace'}).to eq(true)
        expect(book.entries.any?{|entry| entry.name == 'Final Entry Name'}).to eq(true)
      end
    end
    describe "#import_from_csv" do
      # csv must already be in alphabetical order
      # and not include any spaces between items
      it "imports the correct number of entries" do
        book.import_from_csv("entries.csv")
        book_size = book.entries.size
        expect(book_size).to eq 5
      end
      it "imports each entry correctly" do
        book.import_from_csv("entries.csv")
        entry_one = book.entries[0]
        entry_two = book.entries[1]
        entry_three = book.entries[2]
        entry_four = book.entries[3]
        entry_five= book.entries[4]
        check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
      end
      it "imports each entry correctly again" do
        book.import_from_csv("entries_2.csv")
        entry_one = book.entries[0]
        entry_two = book.entries[1]
        entry_three = book.entries[2]
        check_entry(entry_one,"Leah","345-678-9012","leah@blocmail.com")
        check_entry(entry_two,"Luke","234-567-8901","luke@blocmail.com")
        check_entry(entry_three,"Shaina","123-456-7890","shaina@blocmail.com")
      end
    end
end
