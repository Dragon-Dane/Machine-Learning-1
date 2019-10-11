function out = mapping(X1, X2)
    
    m = length(X1);
    out = ones(m,1);
    for i = 1:4
        for j = 0:i
            out(:, end+1) = (X1.^(i-j)).*(X2.^j);
        end
    end

  
endfunction
