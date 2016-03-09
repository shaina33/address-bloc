require_relative '../models/address_book'

RSpec.describe AddressBook do
   describe "attributes" do
      it "responds to entries" do
        book = AddressBook.new
        expect(book).to respond_to(:entries)
      end
      it "initializes entries as an array" do
        book = AddressBook.new
        expect(book.entries).to be_an(Array)
      end
      it "initializes entries as empty" do
        book = AddressBook.new
        expect(book.entries.size).to eq(0)
      end
    end
    describe "#add_entry" do
      it "adds only one entry to the address book" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
        expect(book.entries.size).to eq(1)
      end
 
      it "adds the correct information to entries" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        new_entry = book.entries[0]
 
        expect(new_entry.name).to eq('Ada Lovelace')
        expect(new_entry.phone_number).to eq('010.012.1815')
        expect(new_entry.email).to eq('augusta.king@lovelace.com')
      end
    end
    
    describe "#remove_entry" do
      it "removes only one entry from the address book" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')
        book.remove_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')
 
        expect(book.entries.size).to eq(1)
      end
 
      it "removes the correct information from entries" do
        book = AddressBook.new
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')
        book.add_entry('Final Entry Name', '222.333.4444', 'test@gmail.com')
        book.remove_entry('Shaina Karasin', '111.222.3344', 'shaina@karasin.com')

        expect(book.entries.any?{|entry| entry.name == 'Shaina Karasin'}).to eq(false)
        expect(book.entries.any?{|entry| entry.name == 'Ada Lovelace'}).to eq(true)
        expect(book.entries.any?{|entry| entry.name == 'Final Entry Name'}).to eq(true)
      end
    end
end
