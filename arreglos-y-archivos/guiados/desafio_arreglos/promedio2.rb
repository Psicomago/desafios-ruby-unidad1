def promedio (array)
    (array.sum / array.count.to_f).truncate(2)
end
def compara_array (array1, array2)
    promedio(array1) > promedio(array2) ? promedio(array1) : promedio(array2)
end

y = [5,6,7]
x = [4,5,6]

puts compara_array(x, y)