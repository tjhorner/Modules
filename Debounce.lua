--Now we don't want groundhog day, do we?

function Debounce(func)
    local isRunning = false   
    return function(...)       
        if not isRunning then
            isRunning = true
 
            func(...)         
 
            isRunning = false
        end
    end
end

return Debounce
