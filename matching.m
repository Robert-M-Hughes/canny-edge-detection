function [result] = matching(chamfer, template)

% check which one is target and which one is template using their size

if size(chamfer)>size(template)
    Target=chamfer;
    Template=template;
else
    Target=template;
    Template=chamfer;
end

% find both images sizes
[r1,c1]=size(Target);
[r2,c2]=size(Template);
% mean of the template
tempate2=Template-mean(mean(Template));

%corrolate both images
M=[];
for i=1:(r1-r2+1)
    for j=1:(c1-c2+1)
        Nimage=Target(i:i+r2-1,j:j+c2-1);
        Nimage=Nimage-mean(mean(Nimage));  % mean of image part under mask
        corr=sum(sum(Nimage.*tempate2));
        warning off
        M(i,j)=corr/sqrt(sum(sum(Nimage.^2)));
    end 
end
% plot box on the target image
result=plotbox(Target,Template,M);




end

