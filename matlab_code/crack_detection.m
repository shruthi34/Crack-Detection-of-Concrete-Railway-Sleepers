function crack_detection(imagen,sleeper_name)
    global crack_nos;
    
    % Convert to gray scale
    if size(imagen,3) == 3 % RGB image
      imagen = rgb2gray(imagen);
    end

    % Convert to binary image
    threshold = graythresh(imagen);
    imagen = ~im2bw(imagen,threshold);

    % Remove all object containing fewer than 180 pixels and greater than 300 pixels
    imagen = xor(bwareaopen(imagen,180),  bwareaopen(imagen,300));
    %imshow(~imagen);

    % Label connected components
    [L,Ne] = bwlabel(imagen);
    disp(Ne);
    
    % Measure properties of image regions
    propied = regionprops(L,'BoundingBox');

    % Plot Bounding Box
    if Ne > 0
            rectangle('Position',propied(1).BoundingBox,'EdgeColor','r','LineWidth',2);
            c_slpr = getframe(gca);
            [X,map] = frame2im(c_slpr);
            imwrite(X,strcat('D:\project\cracked_sleepers\',sleeper_name,'.jpg'));
            imwrite(X,strcat('D:\project\temporary_storage\',sleeper_name,'.jpg'));
            crack_nos = crack_nos + 1;
    end
end