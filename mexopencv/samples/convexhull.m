function convexhull
%Experimental
%
% 
%
disp('Convex hull detection. Press any key when done.');

% Set up camera
camera = cv.VideoCapture;
pause(3); % Necessary in some environment. See help cv.VideoCapture

% Set up display window
window = figure('KeyPressFcn',@(obj,evt)setappdata(obj,'flag',true));
setappdata(window,'flag',false);

% Start main loop
while true
    % Grab and preprocess an image
    im = camera.read;
    im = cv.resize(im,0.5);
    gr = cv.cvtColor(im,'RGB2GRAY');
    gr = cv.equalizeHist(gr);
    % Detect & outline convex hull:
    contourVector = cv.findContours(gr, 'Mode', 'Tree');
    disp(contourVector);
    imageOut = cv.drawContours(gr, contourVector);
    
%     imwrite(imageOut, '/Users/tejuskudari/Pictures/imageOut', 'jpg');    
    
    imshow(imageOut);
    
    % Terminate if any user input
    flag = getappdata(window,'flag');
    if isempty(flag)||flag, break; end
    pause(0.1);
end

% Close
close(window);

end
