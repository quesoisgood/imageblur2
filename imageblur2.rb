class Image #creates the Image class
    attr_accessor :array #able to read & write instance variable
    
    def initialize(array)
        @pic = array #@pic is now 
    end

    def output_image #displays the image
        @pic.each do |row|
           puts row.join 
    end
end

    def blur #makes a empty array named coords to hold 
        coords = [] 
            @pic.each_with_index do |row, row_i| #here it will iterates through rows and index the values
                row.each_with_index do |value, value_i|  #here it will iterates through the values of each row
                    if value == 1 #if value is equal to 1 it will push to the coords array 
                        coords << [row_i, value_i]#finish array will be coords =  [[1 ,1], [2, 3]]
                end
            end
        end

        coords.each do |coord| #here it will iterate through the coords array 
            if coord.first != 0 
                @pic[coord.first-1][coord.last] = 1 #up
            end
            if coord.first < @pic.length - 1
                @pic[coord.first+1][coord.last] = 1 #down
            end           
            if coord.last != 0
                @pic[coord.first][coord.last-1] = 1 #left
            end            	       
            if coord.last < @pic.first.length - 1
                @pic[coord.first][coord.last+1] = 1 #right
            end
                    
         end

        puts "blurred Image"
        @pic.each do |row| #will run through each rows of the array
          puts row.join #will join the values together from 0,1,0,0 to 0100
        end 
      end
end #end the class Image

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur
