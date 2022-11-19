class Item
    attr_accessor :title, :description
    attr_reader :deadline
    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline if Item.valid_date?(deadline)     
        @description = description
    end


    def self.valid_date?(date)
        year, month, day = date.split("-")
        if year.to_i.between?(1000, 2100) && month.to_i.between?(1, 12) && day.to_i.between?(1, 31)
            return true
        else
            raise 'dealine is not valid'
        end
    end

    def deadline=(date) 
        @deadline = date if Item.valid_date?(date)
    end


end

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# # p Item.valid_date?('2018-13-20') # false
# # p Item.valid_date?('2018-12-32') # false
# # p Item.valid_date?('10-25-2019') # false




# p my_item = Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# p my_item.title
# # => "Fix login page"
# p my_item.description = 'It loads waaaaaay too slow!'
# # => "It loads waaaaaay too slow!"
# p my_item
# # => #<Item:0x
#         # @deadline="2019-10-22",
#         # @description="It loads waaaaaay too slow!",
#         # @title="Fix login page">
# # p my_item.deadline = "10-23-2019"
# # RuntimeError: deadline is not valid
# p my_item.deadline
# # => "2019-10-22"
# p my_item.deadline = "2019-10-23"
# # => "2019-10-23"

# p my_item.deadline
# # => "2019-10-23"

# p my_item
# => #<Item:0x
    # @deadline="2019-10-23",
    # @description="It loads waaaaaay too slow!",
    #  @title="Fix login page">