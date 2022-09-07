class ListAuthors
    attr_reader :author_list
    def initialize(author_list)
        @author_list = author_list
    end

    def list_authors
        puts "AUTHOR LISTS:\n"
        @author_list.each_with_index do |author, index|
            puts "#{index + 1}. #{author.first_name} #{author.last_name}\n"
        end
        puts "\n"
    end
end