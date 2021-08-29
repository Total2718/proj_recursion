#merge sort recursive algorithm


def merge_sort(current_array, new_array = [])
    

    if current_array.length == 1
    
        return current_array
    else
        #the following slicing is for whether the array has an even or odd length
        if current_array.length.even?
            slice_length = current_array.length / 2
            left_side = current_array.slice(0, slice_length)
            right_side = current_array.slice(slice_length, slice_length)

        elsif current_array.length.odd?
            slice_length = (current_array.length-1)/2
            left_side = current_array.slice(0, slice_length)
            right_side = current_array.slice(slice_length, slice_length+1)
           
        end
        
        sorted_left = merge_sort(left_side)
        sorted_right = merge_sort(right_side)
        
        #the vaiable n 'loops' through the sorted left array
        #the variable m 'loops' through the sorted right array
        n = 0
        m = 0
        #both arrays are simultaneously looped through
        #if either array is completely looped through and added the other array 
        #is added to the new array
        while m < sorted_right.length

             if n != sorted_left.length
                if sorted_right[m] >= sorted_left[n]
                    new_array.append(sorted_left[n])
                    n += 1
                elsif sorted_right[m] < sorted_left[n]
                    new_array.append(sorted_right[m])
                    m += 1
                end
            elsif n == sorted_left.length
                new_array.append(sorted_right[m])
                m += 1

            end
            
            
        end
            if n != sorted_left.length
                new_array.concat(sorted_left.slice(n,sorted_left.length - n))
            end

        return new_array

            
            

    end
end

def show_array(list)
    for number in list
        print number
    end
    puts "\n"

end

numbers = [1, 5, 8, 6, 3, 2, 7]
show_array( merge_sort(numbers))