function [chamfer] = Chamfer(inputImage)


[height, width] = size(inputImage);

for x = 1:height
    for y = 1:width
        if inputImage(x,y) == 255
            chamfer(x,y) = Inf;
        else
            if x-1 >0 && y-1> 0
           chamfer(x,y)
           chamfer(x,y) = min (Inf, 1+chamfer(x-1,y), 1+chamfer(x,y-1)); 
            end
        end
    end
end

for i = 1:height
    for j = 1:width
        if(inputImage(x,y) ==255)
            chamfer(x,y) = 0;
        else
            if x+1 < height && y+1 < width
            chamfer(x,y) = min(chamfer(x,y), 1+chamfer(x+1,y), 1+chamfer(x,y+1));
            end
        end
    end
end

end

