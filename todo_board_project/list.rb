require_relative "item"
class List
    attr_accessor :label; :items
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.size
    end

    def valid_index?(*index_array)
        index_array.all? {|index| index.between?(0, size-1)}
    end

    def up(index, amount=nil)
        amount = index if amount.nil? || amount > index 
        amount.times do
            swap(index, index-1)
        end
        true
    end

    def down(index, amount=nil)
        limit = size - 1
        amount = 1 if amount.nil? 
        amount = limit - index if index + amount > limit 
        amount.times do
            swap(index, index+1)
        end
        true
    end

    def swap(index_1, index_2)
        if valid_index?(index_1, index_2)
                @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
                return true
        else
            return false
        end
    end

    def [](index)
        if valid_index?
            @items[index]
        else
            return nil
        end
    end

    def priority
        @items.first
    end

    def print
        puts "=".ljust(60, "=")
        puts "                        #{@label}".ljust(60)
        puts "=".ljust(60, "=")
        puts "  Index|   Item                               | Deadline".ljust(10)          
        puts "=".ljust(60, "=")
        @items.each_with_index do |item, index| 
            puts "     #{index.to_s.ljust(2)}|   #{item.title.ljust(30)}     |#{item.deadline.ljust(10)}"
        end
        puts "=".ljust(60, "=")
    end

    def print_full_item(index)
        puts "=".ljust(50, "=")
        if valid_index?(index)
            puts"  #{@items[index].title.ljust(35)}  #{@items[index].deadline.ljust(10)}"
            puts"  #{@items[index].description.ljust(10)}"
        else
            puts"                    THAT ITEM DOES NOT EXIST"                     
        end
        puts "=".ljust(50, "=")
    end

    def print_priority
        print_full_item(0)
    end

end

 my_list = List.new('Groceries')
 my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
 my_list.add_item('toothpaste', '2019-10-25')
 my_list.add_item('shampoo', '2019-10-24')
 my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
#  my_list
#  my_list.size
#  my_list.swap(0,  2)
#  my_list.priority
#  my_list.swap(1,  3)
#  my_list.print_full_item(1)
#  my_list.print_priority
#  puts
 my_list.print
 my_list.down(0)
 my_list.print
 my_list.down(0,2)
 my_list.print
 my_list.up(3, 10)
 my_list.print
