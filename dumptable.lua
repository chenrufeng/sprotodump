    --- @param [max_level] tableҪչ¿ª´òļÆýÏil±íȫ²¿չ¿ª  
    --- @param [prefix] ÓÓÔµݹé´«µÝõ¬¸òÎýû§ʹÓÓ  
    --- @ref http://dearymz.blog.163.com/blog/static/205657420089251655186/ 
    local tb = {} 
    function tb.var_dump(data, max_level, prefix)  
        if type(prefix) ~= "string" then  
            prefix = ""  
        end  
        if type(data) ~= "table" then  
            print(prefix .. tostring(data))  
        else  
            print(data)  
            if max_level ~= 0 then  
                local prefix_next = prefix .. "    "  
                print(prefix .. "{")  
                for k,v in pairs(data) do  
                    io.stdout:write(prefix_next .. k .. " = ")  
                    if type(v) ~= "table" or (type(max_level) == "number" and max_level <= 1) then  
                        print(v)  
                    else  
                        if max_level == nil then  
                            tb.var_dump(v, nil, prefix_next)  
                        else  
                            tb.var_dump(v, max_level - 1, prefix_next)  
                        end  
                    end  
                end  
                print(prefix .. "}")  
            end  
        end  
    end  
      
    function tb.vd(data, max_level)  
        tb.var_dump(data, max_level or 8)  
    end 
return tb
