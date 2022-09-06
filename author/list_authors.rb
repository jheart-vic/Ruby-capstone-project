class ListAuthors
    @attr_reader :author_list
    def initialize(author_list)
        @author_list = author_list
    end

    def list_authors
        @author_list.each do |author, index|
            puts "#{index + 1}. AuthorID: #{author.id}. #{author.first_name} #{author.last_name}\n"
        end
    end
end