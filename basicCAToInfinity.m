%exercise 7.4
function basicCAToInfinity
cells = round(rand(1,20));
ruleset = round(rand(1,8));
while true
    [r,c] = size(cells); 
    for y = r:-1:1
        
        for i = 1:c
            if cells(r-y+1,i) == 1
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'white')
                hold on
            else
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'black')
                hold on
            end
        end
    end
    axis equal
    title('1 Dimentional- Random ruleset, starting states');
    ylabel('Time');
    pause(.5)
    hold off
    cells = nextRow(cells);
end

sum(cells)

    function arr = nextRow(arr)
        [row, col] = size(arr);
        neighbors = [num2str(arr(end,end)), num2str(arr(end,1)), num2str(arr(end,2))];
        ind = bin2dec(neighbors);
        next(1) = ruleset(ind+1);
        
        for x = 2:col-1
            neighbors = [num2str(arr(end,x-1)), num2str(arr(end,x)), num2str(arr(end,x+1))];
            ind = bin2dec(neighbors);
            next(x) = ruleset(ind+1);
        end
        
        neighbors = [num2str(arr(end,end-1)), num2str(arr(end,end)), num2str(arr(end,1))];
        ind = bin2dec(neighbors);
        next(col) = ruleset(ind+1);
        
        if (row == 20)
            arr(1, :) = [];
        end
        arr = [arr;next];
        
    end

end
    