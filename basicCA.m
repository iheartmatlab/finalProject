function basicCA
cells = round(rand(1,20));
cells(10) = 1;
ruleset = [0,1,0,1,1,0,1,0]; 
numRuns = 0;
while numRuns<20
    numRuns=numRuns+1;
    [r,c] = size(cells); 
    for y = r:-1:1
        
        for i = 1:c
            if cells(r-y+1,i) == 1
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'black')
                hold on
            else
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'white')
                hold on
            end
        end
    end
    axis equal
    title('1 dimentional- Rule 90');
    ylabel('Time');
    pause
    hold off
    cells = nextRow(cells);
end

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
        
        arr = [arr;next];
    end

end
    