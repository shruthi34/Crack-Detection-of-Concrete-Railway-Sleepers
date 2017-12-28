%%Image segmentation and extraction
function extract_name(imagen)
global sleeper_name;
    %%Read and show Image
    imagen1 = imagen;

    %% Convert to gray scale
    if size(imagen,3)==3 % RGB image
      imagen = rgb2gray(imagen);
    end

    %% Convert to binary image
    threshold = graythresh(imagen);
    imagen =~im2bw(imagen,threshold);

    %% Remove all object containing fewer than 60 pixels and greater than 500 pixels
    %imagen = bwareaopen(imagen,111);
    imagen = xor(bwareaopen(imagen,60),  bwareaopen(imagen,500));

    %% Label connected components
    [L Ne]=bwlabel(imagen);

    %% Measure properties of image regions
    propied=regionprops(L,'BoundingBox');
    hold on

    %% Plot Bounding Box
%     for n=1:size(propied,1)
%       rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
%     end
    hold off

    %% Storing sleepers in database
    results = ocr(imagen);
    name = results.Text;
    name1='';
    x='';
    length1 = numel(name);%numel counts number of elements
    alphacount = 0;

    if length1 >= 6
        for n = 1:length1
            if name(n)>=65 && name(n)<=90
                name1 = strcat(name1,name(n));
                if alphacount >= 2
                    x='';
                    for n1 = 2:numel(name1)
                        x = strcat(x,name1(n1));
                    end
                    name1 = x;
                end
                alphacount = alphacount + 1;
            end
            if name(n)>=48 && name(n)<=57 && numel(name1)<6
                name1 = strcat(name1,name(n));
            end
        end
    end

    disp(name1);
    sleeper_name = name1;

    if ~isempty(name1)
%         imwrite(imagen1,strcat('D:/project/sleepers/',name1,'.jpg'));
    else
        disp('discarded');
    end
end